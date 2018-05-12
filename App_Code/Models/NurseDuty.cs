
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("NurseDuty")]
    public partial class NurseDuty
    {
        public int NurseDutyID { get; set; }

        public int NurseID { get; set; }

        public int DutyTypeID { get; set; }

        [Column(TypeName = "date")]
        public DateTime StartDate { get; set; }

        [Column(TypeName = "date")]
        public DateTime EndDate { get; set; }

        public int CreatedByID { get; set; }

        public int? ModifiedByID { get; set; }

        [Column(TypeName = "date")]
        public DateTime CreatedByDate { get; set; }

        [Column(TypeName = "date")]
        public DateTime? ModifiedByDate { get; set; }
    }

