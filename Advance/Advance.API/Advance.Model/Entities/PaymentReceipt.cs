using System;
using System.Collections.Generic;

namespace Advance.Model.Entities
{

    
    public class PaymentReceipt
    {
        public int PaymentReceiptID { get; set; }
        public Nullable<System.DateTime> ReceiptDate { get; set; }
        public string ReceiptDescription { get; set; }
        public Nullable<System.DateTime> DeterminedPaybackDate { get; set; }
        public string IsActive { get; set; }
        public Nullable<int> ModifiedBy { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public Nullable<System.DateTime> ModifiedDate { get; set; }
        public Nullable<int> CreatedBy { get; set; }
    }
}
