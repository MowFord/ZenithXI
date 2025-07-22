/************************************************************************
 * Fishing Fatigue
 *
 * This module implements fishing fatigue, which limits the number of fish
 * a player can catch in a day. The regular limit is 200 fish/items as
 * per retail, but is limited to 20 fish/items for new accounts until
 * they have reached a required rank in any of the three nations.
 *
 * The amount of fish caught is tracked in the player's char_vars, and
 * resets at JST midnight. We inspect the Fishing Minigame 2 Packet
 * (0x110) and check if minigame sends the ANIMATION_FISHING_CAUGHT
 * animation. If the character had hooked a small/big fish or an item
 * as well, we increase the char_var by 1.
 *
 * Limiting the fishing action is done by inspecting the Player Action
 * packet (0x01A) to see if the player is attempting a Fish Action (0x0E).
 * If the daily cap was reached, we set the lastCastTime to 600 seconds in
 * the future. This will cause the FishingAction to automatically fail
 * into CatchNothing. A message will be sent to the player informing them
 * the limit has been reached.
 *
 * This script will allow for players to resume fishing after Ranking
 * up their nation and changing zones, up to the new limit. Changing
 * Allegiance won't cause you to lose your unlocked 200 daily cap.
 ************************************************************************/
#include "map/packets/chat_message.h"
#include "map/utils/charutils.h"
#include "map/utils/moduleutils.h"

extern uint8                                                                     PacketSize[512];
extern std::function<void(MapSession* const, CCharEntity* const, CBasicPacket&)> PacketParser[512];

class FishingFatigueModule : public CPPModule
{
    std::string CAUGHT = "[FISHING]CAUGHT";

    const uint8  RANK_REQUIRED = 3;
    const uint16 FISHING_LOWER = 20;  // Lower limit for fishing
    const uint16 FISHING_UPPER = 200; // Upper limit for fishing

    uint16 getCaughtLimit(CCharEntity* PChar)
    {
        uint8 rankSandoria           = PChar->profile.rank[NATION_SANDORIA];
        uint8 rankBastok             = PChar->profile.rank[NATION_BASTOK];
        uint8 rankWindurst           = PChar->profile.rank[NATION_WINDURST];
        bool  isSufficientNationRank = (rankSandoria >= RANK_REQUIRED || rankBastok >= RANK_REQUIRED || rankWindurst >= RANK_REQUIRED);

        return isSufficientNationRank ? FISHING_UPPER : FISHING_LOWER;
    }

    void OnInit() override
    {
        TracyZoneScoped;
        /************************************************************************
         *                        PacketParser methods
         ************************************************************************/
        {
            auto playerAction        = PacketParser[0x01A];
            auto playerActionFatigue = [this, playerAction](MapSession* const PSession, CCharEntity* const PChar, CBasicPacket& data) -> void
            {
                TracyZoneScoped;
                uint8 action = data.ref<uint8>(0x0A);
                playerAction(PSession, PChar, data);

                if (action == 0x0E)
                {
                    uint16 caught = charutils::GetCharVar(PChar, CAUGHT);
                    uint16 limit  = getCaughtLimit(PChar);

                    if (caught >= limit)
                    {
                        if (PChar->GetLocalVar("FishingFatigueMessage") == 0)
                        {
                            PChar->pushPacket<CChatMessagePacket>(PChar, MESSAGE_SYSTEM_3, fmt::format("You have reached your daily fishing limit. "));
                            PChar->SetLocalVar("FishingFatigueMessage", 1);
                        }
                        PChar->lastCastTime += 600; // ensure first FISHACTION_CHECK auto fails and they catch nothing
                    }
                }
            };
            PacketParser[0x01A] = playerActionFatigue;

            auto fishingMinigame       = PacketParser[0x110];
            auto fishingMinigameResult = [this, fishingMinigame](MapSession* const PSession, CCharEntity* const PChar, CBasicPacket& data) -> void
            {
                TracyZoneScoped;
                fishingMinigame(PSession, PChar, data);

                uint8 animationID = PChar->animation;
                if (animationID == ANIMATION_FISHING_CAUGHT)
                {
                    uint8 catchType = PChar->hookedFish->catchtype;
                    if (catchType >= FISHINGCATCHTYPE_SMALLFISH && catchType <= FISHINGCATCHTYPE_ITEM)
                    {
                        uint16 caught          = charutils::GetCharVar(PChar, CAUGHT);
                        auto   nextJstMidnight = earth_time::jst::get_next_midnight(earth_time::now());
                        PChar->setCharVar(CAUGHT, caught + 1, earth_time::timestamp(nextJstMidnight));
                    }
                }
            };
            PacketParser[0x110] = fishingMinigameResult;
        }
    }
};

REGISTER_CPP_MODULE(FishingFatigueModule);
