using SWLOR.Game.Server.Event.Conversation.Quest.CollectQuestItem;

// ReSharper disable once CheckNamespace
namespace NWN.Scripts
{
#pragma warning disable IDE1006 // Naming Styles
    public class collect_item_1
#pragma warning restore IDE1006 // Naming Styles
    {
        public static int Main()
        {
            return QuestCollectItem.Check(1) ? 1 : 0;
        }
    }
}
