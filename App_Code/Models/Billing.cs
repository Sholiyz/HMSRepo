using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.Spatial;

[Table("Billing")]
public partial class Billing
{
    public int ID { get; set; }

    [StringLength(50)]
    public string BillingID { get; set; }

    public int StaffID { get; set; }

    public int PatientID { get; set; }

    public int BillForID { get; set; }

    public int TransactionTypeID { get; set; }

    public int? ConsultationID { get; set; }

    [Column(TypeName = "money")]
    public decimal BillingCost { get; set; }

    public int CreatedByID { get; set; }

    public int? ModifiedByID { get; set; }

    [Column(TypeName = "date")]
    public DateTime CreatedDate { get; set; }

    [Column(TypeName = "date")]
    public DateTime? ModifiedDate { get; set; }

    public bool IsDeleted { get; set; }
}

