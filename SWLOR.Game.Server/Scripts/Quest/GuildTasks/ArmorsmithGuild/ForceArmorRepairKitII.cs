using SWLOR.Game.Server.Enumeration;
using SWLOR.Game.Server.Quest;

namespace SWLOR.Game.Server.Scripts.Quest.GuildTasks.ArmorsmithGuild
{
    public class ForceArmorRepairKitII: AbstractQuest
    {
        public ForceArmorRepairKitII()
        {
            CreateQuest(146, "Armorsmith Guild Task: 1x Force Armor Repair Kit II", "arm_tsk_146")
                .IsRepeatable()

                .AddObjectiveCollectItem(1, "fa_rep_2", 1, true)

                .AddRewardGold(220)
                .AddRewardGuildPoints(GuildType.ArmorsmithGuild, 48);
        }
    }
}
