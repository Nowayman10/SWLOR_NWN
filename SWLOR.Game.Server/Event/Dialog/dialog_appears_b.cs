﻿using SWLOR.Game.Server.Service;

// ReSharper disable once CheckNamespace
namespace NWN.Scripts
{
#pragma warning disable IDE1006 // Naming Styles
    public class dialog_appears_b
#pragma warning restore IDE1006 // Naming Styles
    {
        // ReSharper disable once UnusedMember.Local
        public static int Main()
        {
            return DialogService.OnAppearsWhen(5, 14) ? 1 : 0;
        }
    }
}