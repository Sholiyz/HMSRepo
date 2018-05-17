 using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class AuthUser
    {
        [Key]
        public int UserID { get; set; }

        [Required]
        [StringLength(150)]
        public string UserName { get; set; }

        [Required]
        public string Password { get; set; }

        public int StaffID { get; set; }

        public int StaffRoleID { get; set; }

        public int CreatedByID { get; set; }

        public int? ModifiedByID { get; set; }

        [Column(TypeName = "date")]
        public DateTime CreatedDate { get; set; }

        [Column(TypeName = "date")]
        public DateTime? ModifiedDate { get; set; }

        public int FailedLoginCount { get; set; }

        public bool IsActive { get; set; }

        public bool IsDeleted { get; set; }
    }

