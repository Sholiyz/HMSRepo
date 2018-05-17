 using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PatientPlanType")]
    public partial class PatientPlanType
    {
        [Key]
        public int PlanTypeID { get; set; }

        [Required]
        [StringLength(50)]
        public string PlanTypeName { get; set; }

        [StringLength(150)]
        public string PlanTypeDescription { get; set; }

        public int PlanTypeMaximumMember { get; set; }

        public int CreatedByID { get; set; }

        public int? ModifiedByID { get; set; }

        [Column(TypeName = "date")]
        public DateTime CreatedDate { get; set; }

        [Column(TypeName = "date")]
        public DateTime? ModifiedDate { get; set; }

        public bool IsDeleted { get; set; }
    }

