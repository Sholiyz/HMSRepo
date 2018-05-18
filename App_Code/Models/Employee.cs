
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.Spatial;

[Table("Employee")]
public partial class Employee
{
    public int EmployeeID { get; set; }

    public int StaffTypeID { get; set; }

    [Required]
    [StringLength(50)]
    public string FirstName { get; set; }

    [Required]
    [StringLength(50)]
    public string LastName { get; set; }

    [StringLength(50)]
    public string OtherNames { get; set; }

    [Required]
    [StringLength(150)]
    public string FullName { get { return FirstName + " " + LastName + " " + OtherNames; } }


    [StringLength(10)]
    public string Gender { get; set; }

    [StringLength(18)]
    public string PhoneNumber { get; set; }

    [StringLength(50)]
    public string Address { get; set; }

    [Column(TypeName = "image")]
    public byte[] Picture { get; set; }

    [Column(TypeName = "date")]
    public DateTime DOB { get; set; }

    [Column(TypeName = "date")]
    public DateTime? DateEmployed { get; set; }

    public int CreatedByID { get; set; }

    public int? ModifiedByID { get; set; }

    [Column(TypeName = "date")]
    public DateTime CreatedDate { get; set; }

    [Column(TypeName = "date")]
    public DateTime? ModifiedDate { get; set; }

    public bool IsActive { get; set; }

    public bool IsDeleted { get; set; }
}

