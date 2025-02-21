﻿using SWLOR.Game.Server.NWN;
using SWLOR.Game.Server.GameObject;

namespace SWLOR.Game.Server.Scripts.Placeable.Resource
{
    public class OnUsed: IScript
    {
        public void SubscribeEvents()
        {
        }

        public void UnsubscribeEvents()
        {
        }

        public void Main()
        {
            NWCreature user = (_.GetLastUsedBy());
            user.SendMessage("Use a scanner to analyze this object's resources. Use a harvester to retrieve resources from it.");
        }
    }
}
