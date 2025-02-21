using SWLOR.Game.Server.Enumeration;
using SWLOR.Game.Server.Quest;

namespace SWLOR.Game.Server.Scripts.Quest.GuildTasks.EngineeringGuild
{
    public class WeaponsmithI: AbstractQuest
    {
        public WeaponsmithI()
        {
            CreateQuest(409, "Engineering Guild Task: 1x Weaponsmith I", "eng_tsk_409")
                .IsRepeatable()

                .AddObjectiveCollectItem(1, "rune_wpnsmth1", 1, true)

                .AddRewardGold(70)
                .AddRewardGuildPoints(GuildType.EngineeringGuild, 15);
        }
    }
}
