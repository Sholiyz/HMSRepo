using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Employee
/// </summary>
public class Employee
{
    public int StaffID { get; set; }
    public string StaffType { get; set; }

    public string FirstName { get; set; }


    public string LastName { get; set; }

   
    public string OtherNames { get; set; }

 
    public string FullName { get; set; }


    public string Gender { get; set; }

   
    public string PhoneNumber { get; set; }

    public string Address { get; set; }

    
    public byte[] Picture { get; set; }


    public DateTime DOB { get; set; }

  
    public DateTime? DateEmployed { get; set; }

    public int CreatedByID { get; set; }

    public int? ModifiedByID { get; set; }


    public DateTime CreatedDate { get; set; }

 
    public DateTime? ModifiedDate { get; set; }

    public bool IsActive { get; set; }

    public bool IsDeleted { get; set; }
}