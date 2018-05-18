
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("StaffType")]
    public partial class StaffType
    {
        public int ID { get; set; }

        [Column("StaffType")]
        [Required]
        [StringLength(50)]
        public string StaffType1 { get; set; }

        [StringLength(50)]
        public string Description { get; set; }
    }

