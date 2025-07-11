/*---------------------------------
-- Fishing Fatigue
---------------------------------*/
#include "map/packets/chat_message.h"
#include "map/utils/charutils.h"
#include "map/utils/moduleutils.h"

extern uint8                                                                     PacketSize[512];
extern std::function<void(MapSession* const, CCharEntity* const, CBasicPacket&)> PacketParser[512];

class FishingFatigueModule : public CPPModule
{
    std::string CAUGHT = "[FISHING]CAUGHT";

    const uint8  SANDORIA_NATION_ID = 0;
    const uint8  BASTOK_NATION_ID   = 1;
    const uint8  WINDURST_NATION_ID = 2;
    const uint8  RANK_REQUIRED      = 3;
    const uint16 FISHING_LOWER      = 20;  // Lower limit for fishing
    const uint16 FISHING_UPPER      = 200; // Upper limit for fishing

    uint16 getCaughtLimit(CCharEntity* PChar)
    {
        uint8 rankSandoria           = PChar->profile.rank[SANDORIA_NATION_ID];
        uint8 rankBastok             = PChar->profile.rank[BASTOK_NATION_ID];
        uint8 rankWindurst           = PChar->profile.rank[WINDURST_NATION_ID];
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
            auto playerAction    = PacketParser[0x01A];
            auto fishingMinigame = PacketParser[0x110];

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
