
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TrasactionType")]
    public partial class TrasactionType
    {
        public int TrasactionTypeID { get; set; }

        [Required]
        [StringLength(50)]
        public string TrasactionTypeName { get; set; }

        [StringLength(150)]
        public string Description { get; set; }

        public int CreatedByID { get; set; }

        public int? ModifiedByID { get; set; }

        [Column(TypeName = "date")]
        public DateTime CreatedDate { get; set; }

        [Column(TypeName = "date")]
        public DateTime? ModifiedDate { get; set; }

        public bool IsDeleted { get; set; }
    }

