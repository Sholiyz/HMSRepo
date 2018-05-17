
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("HospitalInfo")]
    public partial class HospitalInfo
    {
        public int ID { get; set; }

        [Required]
        [StringLength(50)]
        public string HospitalName { get; set; }

        [StringLength(50)]
        public string Address { get; set; }

        [Required]
        [StringLength(18)]
        public string PhoneNumber { get; set; }

        [Column(TypeName = "image")]
        public byte[] Logo { get; set; }

        [StringLength(50)]
        public string Email { get; set; }

        [StringLength(50)]
        public string Wedsite { get; set; }

        public int CreatedByID { get; set; }

        [Column(TypeName = "date")]
        public DateTime CreatedDate { get; set; }

        public int? ModifiedByID { get; set; }

        [Column(TypeName = "date")]
        public DateTime? ModifiedDate { get; set; }

        [StringLength(150)]
        public string CloudHospitalID { get; set; }
    }
