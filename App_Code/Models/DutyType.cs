
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DutyType")]
    public partial class DutyType
    {
        public int DutyTypeID { get; set; }

        [Required]
        [StringLength(50)]
        public string DutyTypeName { get; set; }

        [StringLength(150)]
        public string Description { get; set; }

        public int Duration { get; set; }

        public TimeSpan? StartTime { get; set; }

        public TimeSpan? EndTime { get; set; }

        public int CreatedByID { get; set; }

        public int? ModifiedByID { get; set; }

        [Column(TypeName = "date")]
        public DateTime CreatedDate { get; set; }

        [Column(TypeName = "date")]
        public DateTime? ModifiesDate { get; set; }

        public bool IsDeleted { get; set; }
    }

