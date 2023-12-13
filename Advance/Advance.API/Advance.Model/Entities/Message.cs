using System;
using System.Collections.Generic;

namespace Advance.Model.Entities
{
    
    
    public class Message
    {
        public int MessageID { get; set; }
        public string MessageName { get; set; }
        public string MessageDescription { get; set; }
        public Nullable<int> MessageTakerID { get; set; }
        public Nullable<int> MessageSenderID { get; set; }
    
       
    }
}
