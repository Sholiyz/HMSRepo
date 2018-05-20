using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;


/// <summary>
/// Summary description for Pasture
/// </summary>
public partial class Pasture
{
    
    private static HSMModelDataContext DBContext = new HSMModelDataContext();
    public Pasture()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    #region Employee
    public static List<Employee> GetEmployees()
    {
        DBContext = new HSMModelDataContext();
        List<Employee> EmployeeList = new List<Employee>();
        EmployeeList =  DBContext.Employees.Where(d => d.IsDeleted==false).ToList();//d.IsActive == true &&
        return EmployeeList;
    }
    public static List<Employee> GetDoctorsList()
    {
        DBContext = new HSMModelDataContext();
        List<Employee> EmployeeList = new List<Employee>();
        EmployeeList = DBContext.Employees.Where(d => d.StaffTypeID==2 && d.IsDeleted == false).ToList();//d.IsActive == true &&
        return EmployeeList;
    }

    public static List<Employee> GetNursesList()
    {
        DBContext = new HSMModelDataContext();
        List<Employee> EmployeeList = new List<Employee>();
        EmployeeList = DBContext.Employees.Where(d => d.StaffTypeID == 1 && d.IsDeleted == false).ToList();//d.IsActive == true &&
        return EmployeeList;
    }
    public static Employee GetEmployeeByID(int EmployeeID)
    {
        DBContext = new HSMModelDataContext();
        Employee Employee = new Employee();
        Employee = DBContext.Employees.Where(d => d.EmployeeID == EmployeeID).FirstOrDefault();
        return Employee;
    }

    public static string GetEmployeeFullNameById(int staffid)
    {
        DBContext = new HSMModelDataContext();
        string fullname;// = new Employee();
        fullname = DBContext.Employees.Where(e => e.EmployeeID == staffid).FirstOrDefault().FullName;
        return fullname;
    }

    public static int AddNewEmployee(Employee newEmployee)
    {
        
        //Employee emp = new Employee();
        string errorMessage = string.Empty;
        int response = 0;
        try
        {
            DBContext = new HSMModelDataContext();
            newEmployee.CreatedByID = GetCurrentUserSessionID();
            newEmployee.CreatedDate = DateTime.Now;
            newEmployee.FullName = newEmployee.FirstName+" "+newEmployee.LastName+" "+newEmployee.OtherNames;
            newEmployee.IsActive = true;
            DBContext.Employees.Add(newEmployee);
            response = DBContext.SaveChanges();
            return response;
        }
        catch (Exception ex)
        {
            errorMessage = ex.Message != "" ? ex.Message : ex.InnerException.Message;
            return response;
            //throw;
        }
    }

    public static int UpdateEmployee(Employee updEmployee)
    {

        int response = 0;
        try
        {
            DBContext = new HSMModelDataContext();
            //get patient
            Employee employee = DBContext.Employees.Where(d => d.EmployeeID == updEmployee.EmployeeID).FirstOrDefault();

            employee.FirstName = updEmployee.FirstName +" "+ updEmployee.LastName +" "+updEmployee.OtherNames;
            employee.ModifiedByID = GetCurrentUserSessionID();
            employee.ModifiedDate = DateTime.Now;
            response = DBContext.SaveChanges();
            return response;
        }
        catch (Exception)
        {
            return response;
            //throw;
        }
    }

    public static int DeleteEmployee(int delEmployeeId)
    {
        int response = 0;
        try
        {
            DBContext = new HSMModelDataContext();
            Employee Employee = DBContext.Employees.Where(d => d.EmployeeID == delEmployeeId).FirstOrDefault();

            //update fields
            Employee.IsActive = false;
            Employee.IsDeleted = false;
            Employee.ModifiedByID = GetCurrentUserSessionID();
            Employee.ModifiedDate = DateTime.Now;
            response = DBContext.SaveChanges();
            return response;
        }
        catch (Exception)
        {
            return response;
            //throw;
        }
    }

    public static bool DeactivateEmployee(int employeeId)
    {
        bool response = false;
        try
        {
            DBContext = new HSMModelDataContext();
            Employee Employee = DBContext.Employees.FirstOrDefault(d => d.EmployeeID == employeeId);

            if (Employee.IsActive.Equals(true))
            {
                //Deactive Employee
                Employee.IsActive = false;
                Employee.ModifiedByID = GetCurrentUserSessionID();
                Employee.ModifiedDate = DateTime.Now;
                response = Convert.ToBoolean(DBContext.SaveChanges());
            }
            return response;
        }
        catch (Exception)
        {
            return response;
            throw;
        }
    }

    public static bool ActivateEmployee(int employeeId)
    {
        bool response = false;
        try
        {
            DBContext = new HSMModelDataContext();
            Employee Employee = DBContext.Employees.FirstOrDefault(d => d.EmployeeID == employeeId);

            if (Employee.IsActive.Equals(false))
            {
                //Deactive Employee
                Employee.IsActive = true;
                Employee.ModifiedByID = GetCurrentUserSessionID();
                Employee.ModifiedDate = DateTime.Now;
                response = Convert.ToBoolean(DBContext.SaveChanges());
            }
            return response;
        }
        catch (Exception)
        {
            return response;
            //throw;
        }
    }
    #endregion

    #region Hospital Info Management

    public static HospitalInfo GetHospitalInfo()
    {
        DBContext = new HSMModelDataContext();
        HospitalInfo HospitalInfo = new HospitalInfo();
        HospitalInfo = DBContext.HospitalInfoes.FirstOrDefault();
        return HospitalInfo;
    }
    
    public static int AddHospitalInfo(HospitalInfo newHospitalInfo)
    {
        try
        {
            DBContext = new HSMModelDataContext();
            int responce;
            newHospitalInfo.CreatedByID = GetCurrentUserSessionID();
            newHospitalInfo.CreatedDate = DateTime.Now;
            DBContext.HospitalInfoes.Add(newHospitalInfo);
            responce = DBContext.SaveChanges();
            return responce;
        }
        catch (Exception ex)
        {
            return 0;
            //log ex.Message;
            throw;
        }

    }
    public static int UpdateHospitalInfo(HospitalInfo UpdateHospitalInfo)
    {
        try
        {
            DBContext = new HSMModelDataContext();
            int responce;
            HospitalInfo HospitalInfo = DBContext.HospitalInfoes.FirstOrDefault();
            //DBContext.AuthRoles.Add(newRole);
            
            HospitalInfo.ModifiedByID = GetCurrentUserSessionID();
            HospitalInfo.ModifiedDate = DateTime.Now;
            responce = DBContext.SaveChanges();
            return responce;
        }
        catch (Exception ex)
        {
            return 0;
            //log ex.Message;
            throw;
        }

    }
   
    #endregion

    #region Role Management

    public static List<AuthRole> GetRoles()
    {
        DBContext = new HSMModelDataContext();
        List<AuthRole> RoleList = new List<AuthRole>();
        RoleList = DBContext.AuthRoles.Where(r => r.IsDeleted == false && r.RoleID>1).ToList();
        return RoleList;
    }
    public static AuthRole GetRoleByID(int roleID)
    {
        DBContext = new HSMModelDataContext();
        AuthRole Role = new AuthRole();
        Role = DBContext.AuthRoles.Where(r => r.RoleID == roleID).FirstOrDefault();
        return Role;
    }

    public static string GetRoleNameByRoleID(int roleID)
    {
        DBContext = new HSMModelDataContext();
        string RoleName = "";
        RoleName = DBContext.AuthRoles.Where(r => r.RoleID == roleID).FirstOrDefault().RoleName;
        return RoleName;
    }
    public static int AddNewRole(AuthRole newRole)
    {
        try
        {
            DBContext = new HSMModelDataContext();
            int responce;
            newRole.CreatedByID = GetCurrentUserSessionID();
            newRole.CreatedDate = DateTime.Now;            
            DBContext.AuthRoles.Add(newRole);
            responce = DBContext.SaveChanges();
            return responce;
        }
        catch (Exception ex)
        {
            return 0;
            //log ex.Message;
            throw;
        }

    }
    public static int UpdateRole(AuthRole UpdateRole)
    {
        try
        {
            DBContext = new HSMModelDataContext();
            int responce;
            AuthRole Role = DBContext.AuthRoles.Where(r => r.RoleID == UpdateRole.RoleID).FirstOrDefault();
            //DBContext.AuthRoles.Add(newRole);
            Role.RoleName = UpdateRole.RoleName;
            Role.RoleDescription = UpdateRole.RoleDescription;
            Role.ModifiedByID = GetCurrentUserSessionID();
            Role.ModifiedDate = DateTime.Now;
            responce = DBContext.SaveChanges();
            return responce;
        }
        catch (Exception ex)
        {
            return 0;
            //log ex.Message;
            throw;
        }

    }
    public static int DeleteRoleByID(int DeleteRoleID)
    {
        try
        {
            DBContext = new HSMModelDataContext();
            int responce;
            AuthRole Role = DBContext.AuthRoles.Where(r => r.RoleID == DeleteRoleID).FirstOrDefault();
            //DBContext.AuthRoles.Add(newRole);
            //Role.RoleName = UpdateRole.RoleName;
            //Role.RoleDescription = UpdateRole.RoleDescription;
            Role.IsDeleted = true;            
            Role.ModifiedByID = GetCurrentUserSessionID();
            Role.ModifiedDate = DateTime.Now;
            responce = DBContext.SaveChanges();
            return responce;
        }
        catch (Exception ex)
        {
            return 0;
            //log ex.Message;
            throw;
        }

    }

    #endregion

    #region User Management

    public static List<AuthUser> GetUsers()
    {
        DBContext = new HSMModelDataContext();
        List<AuthUser> UserList = new List<AuthUser>();
        UserList = DBContext.AuthUsers.Where(u => u.IsDeleted == false).ToList();
        return UserList;
    }

    public static List<AuthUser> GetUsersByEmpIDandUsername(int employeeid,string username)
    {
        DBContext = new HSMModelDataContext();
        List<AuthUser> UserList = new List<AuthUser>();
        UserList = DBContext.AuthUsers.Where(u => u.StaffID==employeeid && u.UserName.Contains(username) && u.IsDeleted == false).ToList();
        return UserList;
    }
    public static List<AuthUser> GetUsersByUsername(string username)
    {
        DBContext = new HSMModelDataContext();
        List<AuthUser> UserList = new List<AuthUser>();
        UserList = DBContext.AuthUsers.Where(u => u.UserName.Contains(username) && u.IsDeleted == false).ToList();
        return UserList;
    }
    public static AuthUser GetUserByID(int userID)
    {
        DBContext = new HSMModelDataContext();
        AuthUser User = new AuthUser();
        User = DBContext.AuthUsers.Where(u => u.UserID == userID).FirstOrDefault();
        return User;
    }
    public static List<Employee> GetEmployeeList()
    {
        DBContext = new HSMModelDataContext();
        List<Employee> EmployeeList = new List<Employee>();   
        EmployeeList = DBContext.Employees.Where(emp=> emp.IsDeleted==false).ToList();
       
        return EmployeeList.OrderBy(emp=> emp.FullName).ToList();
    }


    public static AuthUser GetUserByUsername(string username)
    {
        DBContext = new HSMModelDataContext();
        AuthUser User = new AuthUser();
        User = DBContext.AuthUsers.Where(u => u.UserName == username).FirstOrDefault();
        return User;
    }   
    public static int AddNewUser(AuthUser newUser)
    {
        try
        {
            DBContext = new HSMModelDataContext();
            int responce;
            newUser.Password = ProtectPassword(newUser.Password).ToUpper();
            newUser.UserName = GenerateNewUserName(newUser.StaffID);
            newUser.CreatedByID = GetCurrentUserSessionID();
            newUser.IsActive = true;
            newUser.CreatedDate = DateTime.Now;
            DBContext.AuthUsers.Add(newUser);
            responce = DBContext.SaveChanges();
            return responce;
        }
        catch (Exception ex)
        {
            return 0;
            //log ex.Message;
            throw;
        }

    }
    private static string GenerateNewUserName(int staffid)
    {
        string username;

        Employee emp = GetEmployeeByID(staffid);
        if (emp.StaffTypeID == 1)
        {
            username = "HMS-NRS" + emp.EmployeeID.ToString(); //+emp.LastName
        }
        else if(emp.StaffTypeID == 2)
        {
            username = "HMS-DR" + emp.EmployeeID.ToString();
        }
        else
        {
            username = "HMS" + emp.EmployeeID.ToString();
        }

        return username;
    }
    public static int UpdateUser(AuthUser UpdateUser)
    {
        try
        {
            DBContext = new HSMModelDataContext();
            int responce;
            AuthUser User = DBContext.AuthUsers.Where(u => u.UserID == UpdateUser.UserID).FirstOrDefault();
            
            //DBContext.AuthRoles.Add(newRole);
            User.UserName = UpdateUser.UserName;
            User.Password = ProtectPassword(UpdateUser.Password).ToUpper();
            User.StaffRoleID = UpdateUser.StaffRoleID;
            User.IsActive = UpdateUser.IsActive;
            User.ModifiedByID = GetCurrentUserSessionID();
            User.ModifiedDate = DateTime.Now;
            responce = DBContext.SaveChanges();
            return responce;
        }
        catch (Exception ex)
        {
            return 0;
            //log ex.Message;
            throw;
        }

    }
    public static int ActivateOrDeactivateUser(int userid,out bool activatestate)
    {
        try
        {
            DBContext = new HSMModelDataContext();
            int responce;
            AuthUser User = DBContext.AuthUsers.Where(u => u.UserID == userid).FirstOrDefault();

            //DBContext.AuthRoles.Add(newRole);
            if (User.IsActive == true)
            {
                User.FailedLoginCount = 0;
                User.IsActive = false;
                activatestate = false;
            }
            else
            {
                User.FailedLoginCount = 0;
                User.IsActive = true;
                activatestate = true;
            }
            
            User.ModifiedByID = GetCurrentUserSessionID();
            User.ModifiedDate = DateTime.Now;
            responce = DBContext.SaveChanges();
            return responce;
        }
        catch (Exception ex)
        {
            //return 0;
            //log ex.Message;
            throw;
        }

    }
    public static int DeleteUserByID(int DeleteUserid)
    {
        try
        {
            DBContext = new HSMModelDataContext();
            int responce;
            AuthUser User = DBContext.AuthUsers.Where(r => r.UserID == DeleteUserid).FirstOrDefault();
            User.ModifiedByID = GetCurrentUserSessionID();
            User.ModifiedDate = DateTime.Now;
            User.IsDeleted = true;
            User.IsActive = false;
            responce = DBContext.SaveChanges();
            return responce;
        }
        catch (Exception ex)
        {
            return 0;
            //log ex.Message;
            throw;
        }

    }

    #endregion

    #region Patient Management

    public static List<Patient> GetPatients()
    {
        DBContext = new HSMModelDataContext();
        List<Patient> PatientList = new List<Patient>();
        PatientList = DBContext.Patients.Where(p => p.IsDeleted == false).ToList();
        return PatientList;
    }
    public static Patient GetPatientListByID(int patientID)
    {
        DBContext = new HSMModelDataContext();
        Patient Patient = new Patient();
        Patient = DBContext.Patients.Where(p => p.PatientID == patientID).FirstOrDefault();
        return Patient;
    }
    public static int AddNewPatient(Patient newpatient)
    {
        try
        {
            DBContext = new HSMModelDataContext();
            int responce;           
            newpatient.CreatedByID = GetCurrentUserSessionID();
            newpatient.FullName = newpatient.FirstName + " " + newpatient.LastName + " " + newpatient.OtherNames;
            newpatient.CreatedDate = DateTime.Now;
            DBContext.Patients.Add(newpatient);
            responce = DBContext.SaveChanges();
            return responce;
        }
        catch (Exception ex)
        {
            return 0;
            //log ex.Message;
            throw;
        }

    }
    public static int UpdatePatient(Patient UpdatePatient)
    {
        try
        {
            DBContext = new HSMModelDataContext();
            int responce;
            Patient patient = DBContext.Patients.Where(u => u.PatientID == UpdatePatient.PatientID).FirstOrDefault();

            //DBContext.AuthRoles.Add(newRole);         
            //patient.IsActive = UpdatePatient.IsActive;


            patient.OtherNames = UpdatePatient.OtherNames;
            patient.FullName = UpdatePatient.FirstName + " " + UpdatePatient.LastName + " " + UpdatePatient.OtherNames;
            patient.ModifiedByID = GetCurrentUserSessionID();
            patient.ModifiedDate = DateTime.Now;
            responce = DBContext.SaveChanges();
            return responce;
        }
        catch (Exception ex)
        {
            return 0;
            //log ex.Message;
            throw;
        }

    }
    public static int DeletePatientByID(int DeletePatientID)
    {
        try
        {
            DBContext = new HSMModelDataContext();
            int responce;
            Patient patient = DBContext.Patients.Where(p => p.PatientID == DeletePatientID).FirstOrDefault();
            patient.ModifiedByID = GetCurrentUserSessionID();
            patient.ModifiedDate = DateTime.Now;
            patient.IsDeleted = true;
            patient.IsActive = false;
            responce = DBContext.SaveChanges();
            return responce;
        }
        catch (Exception ex)
        {
            return 0;
            //log ex.Message;
            throw;
        }

    }

    #endregion

    #region Assigned Duty Management

    public static List<NurseDuty> GetAssignNurseDutys()
    {
        DBContext = new HSMModelDataContext();
        List<NurseDuty> NurseDutyList = new List<NurseDuty>();
        NurseDutyList = DBContext.NurseDuties.ToList();
        return NurseDutyList;
    }
    public static NurseDuty GetNurseDutyByID(int NurseDutyID)
    {
        DBContext = new HSMModelDataContext();
        NurseDuty NurseDuty = new NurseDuty();
        NurseDuty = DBContext.NurseDuties.Where(n => n.NurseDutyID == NurseDutyID).FirstOrDefault();
        return NurseDuty;
    }
    public static int AddNewNurseDuty(NurseDuty newNurseDuty)
    {
        try
        {
            DBContext = new HSMModelDataContext();
            int responce;
            newNurseDuty.CreatedByID = GetCurrentUserSessionID();
            newNurseDuty.CreatedByDate = DateTime.Now;            
            DBContext.NurseDuties.Add(newNurseDuty);
            responce = DBContext.SaveChanges();
            return responce;
        }
        catch (Exception ex)
        {
            return 0;
            //log ex.Message;
            throw;
        }

    }
    public static int UpdateNurseDuty(NurseDuty updateNurseDuty)
    {
        try
        {
            DBContext = new HSMModelDataContext();
            int responce;
            NurseDuty NurseDuty = DBContext.NurseDuties.Where(nd => nd.NurseDutyID == updateNurseDuty.NurseDutyID).FirstOrDefault();
            //DBContext.AuthRoles.Add(newRole);
            
            NurseDuty.ModifiedByID = GetCurrentUserSessionID();
            NurseDuty.ModifiedByDate = DateTime.Now;
            responce = DBContext.SaveChanges();
            return responce;
        }
        catch (Exception ex)
        {
            return 0;
            //log ex.Message;
            throw;
        }

    }
    public static void DeleteNurseDutyByID(NurseDuty DeleteNurseDuty)
    {
        try
        {
           // return 0;
        }
        catch (Exception ex)
        {
            //return 0;
            //log ex.Message;
            throw;
        }

    }

    #endregion

    #region Patient Plan Management
    public static List<PatientPlanType> GetPatientPlans()
    {
        DBContext = new HSMModelDataContext();
        List<PatientPlanType> PatientPlanList = new List<PatientPlanType>();
        PatientPlanList = DBContext.PatientPlanTypes.Where(ppt=> ppt.IsDeleted==false).ToList();
        return PatientPlanList;
    }
    public static PatientPlanType GetPatientPlanByID(int PatientPlanTypeID)
    {
        DBContext = new HSMModelDataContext();
        PatientPlanType PatientPlan = new PatientPlanType();
        PatientPlan = DBContext.PatientPlanTypes.Where(ppt => ppt.PlanTypeID == PatientPlanTypeID).FirstOrDefault();
        return PatientPlan;
    }
    public static int AddNewPatientPlan(PatientPlanType newPatientPlan)
    {
        try
        {
            DBContext = new HSMModelDataContext();
            int responce;
            newPatientPlan.CreatedByID = GetCurrentUserSessionID();
            newPatientPlan.CreatedDate = DateTime.Now;
            DBContext.PatientPlanTypes.Add(newPatientPlan);
            responce = DBContext.SaveChanges();
            return responce;
        }
        catch (Exception ex)
        {
            return 0;
            //log ex.Message;
            throw;
        }

    }
    public static int UpdatePatientPlan(PatientPlanType updatePatientPlan)
    {
        try
        {
            DBContext = new HSMModelDataContext();
            int responce;
            PatientPlanType PatientPlan = DBContext.PatientPlanTypes.Where(ppt => ppt.PlanTypeID == updatePatientPlan.PlanTypeID).FirstOrDefault();
            //DBContext.AuthRoles.Add(newRole);

            PatientPlan.ModifiedByID = GetCurrentUserSessionID();
            PatientPlan.ModifiedDate = DateTime.Now;
            responce = DBContext.SaveChanges();
            return responce;
        }
        catch (Exception ex)
        {
            return 0;
            //log ex.Message;
            throw;
        }

    }
    public static int DeletePatientPlanByID(int DeletePatientPlanID)
    {
        try
        {
            DBContext = new HSMModelDataContext();
            int responce;
            PatientPlanType PatientPlan = DBContext.PatientPlanTypes.Where(ppt => ppt.PlanTypeID == DeletePatientPlanID).FirstOrDefault();
            //DBContext.AuthRoles.Add(newRole);

            PatientPlan.ModifiedByID = GetCurrentUserSessionID();
            PatientPlan.ModifiedDate = DateTime.Now;
            PatientPlan.IsDeleted = true;
            responce = DBContext.SaveChanges();
            return responce;
        }
        catch (Exception ex)
        {
            return 0;
            //log ex.Message;
            throw;
        }

    }

    #endregion

    #region Duty Type Management

    public static List<DutyType> GetDutyTypes()
    {
        DBContext = new HSMModelDataContext();
        List<DutyType> DutyTypeList = new List<DutyType>();
        DutyTypeList = DBContext.DutyTypes.Where(dt => dt.IsDeleted == false).ToList();
        return DutyTypeList;
    }
    public static DutyType GetDutyTypeByID(int DutyTypeID)
    {
        DBContext = new HSMModelDataContext();
        DutyType dutyType = new DutyType();
        dutyType = DBContext.DutyTypes.Where(dt => dt.DutyTypeID == DutyTypeID).FirstOrDefault();
        return dutyType;
    }
    public static string GetDutyTypeNameByID(int DutyTypeID)
    {
        DBContext = new HSMModelDataContext();
        string dutyTypename = "";// new DutyType();
        dutyTypename = DBContext.DutyTypes.Where(dt => dt.DutyTypeID == DutyTypeID).FirstOrDefault().DutyTypeName;
        return dutyTypename;
    }
    public static TimeSpan GetDutyTypeStartTimeByID(int DutyTypeID)
    {
        DBContext = new HSMModelDataContext();
        TimeSpan dutyTypestarttime;//= "";// new DutyType();
        dutyTypestarttime = (TimeSpan)DBContext.DutyTypes.Where(dt => dt.DutyTypeID == DutyTypeID).FirstOrDefault().StartTime;
        return dutyTypestarttime;
    }
    public static TimeSpan GetDutyTypeEndTimeByID(int DutyTypeID)
    {
        DBContext = new HSMModelDataContext();
        TimeSpan dutyTypeendtime;// = "";// new DutyType();
        dutyTypeendtime =(TimeSpan) DBContext.DutyTypes.Where(dt => dt.DutyTypeID == DutyTypeID).FirstOrDefault().EndTime;
        return dutyTypeendtime;
    }
    public static int AddNewDutyType(DutyType newDutyType)
    {
        try
        {
            DBContext = new HSMModelDataContext();
            int responce;
            newDutyType.CreatedByID = GetCurrentUserSessionID();
            newDutyType.CreatedDate = DateTime.Now;
            newDutyType.Duration = int.Parse(((Convert.ToDateTime(newDutyType.EndTime) - Convert.ToDateTime(newDutyType.StartTime)).TotalHours).ToString());
            DBContext.DutyTypes.Add(newDutyType);
            responce = DBContext.SaveChanges();
            return responce;
        }
        catch (Exception ex)
        {
            return 0;
            //log ex.Message;
            throw;
        }

    }
    public static int UpdateDutyType(DutyType updateDutyType)
    {
        try
        {
            DBContext = new HSMModelDataContext();
            int responce;
            DutyType dutyType = DBContext.DutyTypes.Where(dt => dt.DutyTypeID == updateDutyType.DutyTypeID).FirstOrDefault();
          

            dutyType.ModifiedByID = GetCurrentUserSessionID();
            dutyType.ModifiesDate = DateTime.Now;
            responce = DBContext.SaveChanges();
            return responce;
        }
        catch (Exception ex)
        {
            return 0;
            //log ex.Message;
            throw;
        }

    }
    public static int DeleteDutyTypeByID(int DeleteDutyTypeID)
    {
        try
        {
            DBContext = new HSMModelDataContext();
            int responce;
            DutyType dutyType = DBContext.DutyTypes.Where(dt => dt.DutyTypeID == DeleteDutyTypeID).FirstOrDefault();
            //DBContext.AuthRoles.Add(newRole);

            dutyType.ModifiedByID = GetCurrentUserSessionID();
            dutyType.ModifiesDate = DateTime.Now;
            dutyType.IsDeleted = true;
            responce = DBContext.SaveChanges();
            return responce;
        }
        catch (Exception ex)
        {
            return 0;
            //log ex.Message;
            throw;
        }

    }

    #endregion

    #region Transaction Type Management

    public static List<TransactionType> GetTransactionTypes()
    {
        DBContext = new HSMModelDataContext();
        List<TransactionType> TransactionTypeList = new List<TransactionType>();
        TransactionTypeList = DBContext.TransactionTypes.Where(tranx => tranx.IsDeleted == false).ToList();
        return TransactionTypeList;
    }
    public static TransactionType GetTransactionTypeByID(int TransactionTypeID)
    {
        DBContext = new HSMModelDataContext();
        TransactionType TransactionType = new TransactionType();
        TransactionType = DBContext.TransactionTypes.Where(tranx => tranx.TransactionTypeID == TransactionTypeID).FirstOrDefault();
        return TransactionType;
    }
    public static int AddNewTransactionType(TransactionType newTransactionType)
    {
        try
        {
            DBContext = new HSMModelDataContext();
            int responce;
            newTransactionType.CreatedByID = GetCurrentUserSessionID();
            newTransactionType.CreatedDate = DateTime.Now;
            DBContext.TransactionTypes.Add(newTransactionType);
            responce = DBContext.SaveChanges();
            return responce;
        }
        catch (Exception ex)
        {
            return 0;
            //log ex.Message;
            throw;
        }

    }
    public static int UpdateTransactionType(TransactionType updateTransactionType)
    {
        try
        {
            DBContext = new HSMModelDataContext();
            int responce;
            TransactionType TransactionType = DBContext.TransactionTypes.Where(tranx => tranx.TransactionTypeID == updateTransactionType.TransactionTypeID).FirstOrDefault();
            //DBContext.AuthRoles.Add(newRole);

            TransactionType.ModifiedByID = GetCurrentUserSessionID();
            TransactionType.ModifiedDate = DateTime.Now;
            responce = DBContext.SaveChanges();
            return responce;
        }
        catch (Exception ex)
        {
            return 0;
            //log ex.Message;
            throw;
        }

    }
    public static int DeleteTransactionTypeByID(int DeleteTransactionTypeID)
    {
        try
        {
            DBContext = new HSMModelDataContext();
            int responce;
            TransactionType TransactionType = DBContext.TransactionTypes.Where(tranx => tranx.TransactionTypeID == DeleteTransactionTypeID).FirstOrDefault();
            //DBContext.AuthRoles.Add(newRole);

            TransactionType.ModifiedByID = GetCurrentUserSessionID();
            TransactionType.ModifiedDate = DateTime.Now;
            TransactionType.IsDeleted = true;
            responce = DBContext.SaveChanges();
            return responce;
        }
        catch (Exception ex)
        {
            return 0;
            //log ex.Message;
            throw;
        }

    }

    #endregion

    #region AttendanceLog Management

    public static List<AttendanceLog> GetAttendanceLogList()
    {
        DBContext = new HSMModelDataContext();
        List<AttendanceLog> AttendanceLogList = new List<AttendanceLog>();
        AttendanceLogList = DBContext.AttendanceLogs.ToList();
        return AttendanceLogList;
    }
    public static List<AttendanceLog> GetAttendanceLogByUserIDList(int userid)
    {
        DBContext = new HSMModelDataContext();
        List<AttendanceLog> AttendanceLogList = new List<AttendanceLog>();
        AttendanceLogList = DBContext.AttendanceLogs.Where(log=>log.StaffID==userid).OrderByDescending(atlog=> atlog.AttendanceDate).ToList();
        return AttendanceLogList;
    }
    public static int AddAttendanceLog(AttendanceLog newAttendanceLog)
    {
        try
        {
            DBContext = new HSMModelDataContext();
            int responce;
            newAttendanceLog.StaffID = GetCurrentUserSessionID();
            newAttendanceLog.DutyID = GetStaffLastAttendanceID(GetCurrentUserSessionID());
            newAttendanceLog.ClockInTime = DateTime.Now.TimeOfDay;
            newAttendanceLog.AttendanceDate = DateTime.Now;
            DBContext.AttendanceLogs.Add(newAttendanceLog);
            responce = DBContext.SaveChanges();
            return responce;
        }
        catch (Exception ex)
        {
            return 0;
            //log ex.Message;
            throw;
        }

    }

    public static int CheckActiveAttendanceLog(AttendanceLog UpdateAttendanceLog)
    {
        try
        {
            DBContext = new HSMModelDataContext();
            int responce;
            AttendanceLog AttendanceLog = DBContext.AttendanceLogs.Where(atlog => atlog.AttendanceID == UpdateAttendanceLog.AttendanceID && atlog.StaffID==GetCurrentUserSessionID()).FirstOrDefault();
            //DBContext.AuthRoles.Add(newRole);

            //AttendanceLog.ModifiedByID = GetCurrentUserSessionID();
            AttendanceLog.ClockOutTime = DateTime.Now.TimeOfDay;
            AttendanceLog.IsLocked = true;
            responce = DBContext.SaveChanges();
            return responce;
        }
        catch (Exception ex)
        {
            return 0;
            //log ex.Message;
            throw;
        }

    }

    public static int UpdatenewAttendanceLog(AttendanceLog UpdateAttendanceLog)
    {
        try
        {
            DBContext = new HSMModelDataContext();
            int responce;
            AttendanceLog AttendanceLog = DBContext.AttendanceLogs.Where(atlog=> atlog.AttendanceID== UpdateAttendanceLog.AttendanceID && atlog.StaffID == GetCurrentUserSessionID()).FirstOrDefault();
            //DBContext.AuthRoles.Add(newRole);

            //AttendanceLog.ModifiedByID = GetCurrentUserSessionID();
            AttendanceLog.ClockOutTime = DateTime.Now.TimeOfDay;
            AttendanceLog.IsLocked = true;
            responce = DBContext.SaveChanges();
            return responce;
        }
        catch (Exception ex)
        {
            return 0;
            //log ex.Message;
            throw;
        }

    }

    #endregion

    #region FamilyMember Management
    public static List<FamilyMember> GetFamilyMembers()
    {
        DBContext = new HSMModelDataContext();
        List<FamilyMember> FamilyMemberList = new List<FamilyMember>();
        FamilyMemberList = DBContext.FamilyMembers.Where(fm => fm.IsDeleted == false).ToList();
        return FamilyMemberList;
    }
    public static List<FamilyMember> GetFamilyMembersListByPatientID(int PatientID)
    {
        DBContext = new HSMModelDataContext();
        List<FamilyMember> FamilyMemberList = new List<FamilyMember>();
        FamilyMemberList = DBContext.FamilyMembers.Where(fm => fm.IsDeleted == false && fm.PatientID==PatientID).ToList();
        return FamilyMemberList;
    }
    public static FamilyMember GetFamilyMemberByID(int familymemberID)
    {
        DBContext = new HSMModelDataContext();
        FamilyMember FamilyMember = new FamilyMember();
        FamilyMember = DBContext.FamilyMembers.Where(fm => fm.FamilyMemberID == familymemberID).FirstOrDefault();
        return FamilyMember;
    }
    public static int AddNewFamilyMember(FamilyMember newFamilyMember)
    {
        try
        {
            DBContext = new HSMModelDataContext();
            int responce;
            newFamilyMember.CreatedByID = GetCurrentUserSessionID();
            newFamilyMember.CreatedDate = DateTime.Now;
            DBContext.FamilyMembers.Add(newFamilyMember);
            responce = DBContext.SaveChanges();
            return responce;
        }
        catch (Exception ex)
        {
            return 0;
            //log ex.Message;
            throw;
        }

    }
    public static int UpdateFamilyMember(FamilyMember UpdateFamilyMember)
    {
        try
        {
            DBContext = new HSMModelDataContext();
            int responce;
            FamilyMember familyMember = DBContext.FamilyMembers.Where(fm => fm.FamilyMemberID == UpdateFamilyMember.FamilyMemberID).FirstOrDefault();

            //DBContext.AuthRoles.Add(newRole);         
            
            familyMember.ModifiedByID = GetCurrentUserSessionID();
            familyMember.ModifiedDate = DateTime.Now;
            responce = DBContext.SaveChanges();
            return responce;
        }
        catch (Exception ex)
        {
            return 0;
            //log ex.Message;
            throw;
        }

    }
    public static int DeleteFamilyMemberByID(int DeleteFamilyMemberID)
    {
        try
        {
            DBContext = new HSMModelDataContext();
            int responce;
            FamilyMember familyMember = DBContext.FamilyMembers.Where(fm => fm.FamilyMemberID == DeleteFamilyMemberID).FirstOrDefault();
            familyMember.ModifiedByID = GetCurrentUserSessionID();
            familyMember.ModifiedDate = DateTime.Now;
            familyMember.IsDeleted = true;
           
            responce = DBContext.SaveChanges();
            return responce;
        }
        catch (Exception ex)
        {
            return 0;
            //log ex.Message;
            throw;
        }

    }
    #endregion

    #region Billing Management

    public static List<Billing> GetBillings()
    {
        DBContext = new HSMModelDataContext();
        List<Billing> BillingList = new List<Billing>();
        BillingList = DBContext.Billings.Where(b => b.IsDeleted == false).ToList();
        return BillingList;
    }
    public static List<Billing> GetBillingsByPatientID(int PatientID)
    {
        DBContext = new HSMModelDataContext();
        List<Billing> BillingList = new List<Billing>();
        BillingList = DBContext.Billings.Where(b => b.IsDeleted == false && b.PatientID==PatientID).ToList();
        return BillingList;
    }
    public static Billing GetBillingByID(int BillingID)
    {
        DBContext = new HSMModelDataContext();
        Billing Billing = new Billing();
        Billing = DBContext.Billings.Where(b => b.ID == BillingID).FirstOrDefault();
        return Billing;
    }
    public static List<Billing> GetBillingByListConsultantID(int ConsultantID)
    {
        DBContext = new HSMModelDataContext();
        List<Billing> Billing = new List<Billing>();
        Billing = DBContext.Billings.Where(b => b.IsDeleted == false && b.ConsultationID == ConsultantID).ToList();
        return Billing;
    }
    public static int AddNewBilling(Billing newBilling)
    {
        try
        {
            DBContext = new HSMModelDataContext();
            int responce;
            newBilling.StaffID = GetCurrentUserSessionID();
            newBilling.CreatedByID = GetCurrentUserSessionID();
            newBilling.CreatedDate = DateTime.Now;
            DBContext.Billings.Add(newBilling);
            responce = DBContext.SaveChanges();
            return responce;
        }
        catch (Exception ex)
        {
            return 0;
            //log ex.Message;
            throw;
        }

    }
    public static int UpdateBilling(Billing UpdateBilling)
    {
        try
        {
            DBContext = new HSMModelDataContext();
            int responce;
            Billing Billing = DBContext.Billings.Where(u => u.BillingID == UpdateBilling.BillingID).FirstOrDefault();

            //DBContext.Roles.Add(newRole);
            //Billing.ConsultationID = UpdateBilling.BillingName;
           //Billing.StaffID= GetCurrentUserSessionID();
            Billing.ModifiedByID = GetCurrentUserSessionID();
            Billing.ModifiedDate = DateTime.Now;
            responce = DBContext.SaveChanges();
            return responce;
        }
        catch (Exception ex)
        {
            return 0;
            //log ex.Message;
            throw;
        }

    }
    public static int DeleteBillingByID(string DeleteBillingID)
    {
        try
        {
            DBContext = new HSMModelDataContext();
            int responce;
            Billing Billing = DBContext.Billings.Where(r => r.BillingID == DeleteBillingID).FirstOrDefault();
            Billing.ModifiedByID = GetCurrentUserSessionID();
            Billing.ModifiedDate = DateTime.Now;
            Billing.IsDeleted = true;
            responce = DBContext.SaveChanges();
            return responce;
        }
        catch (Exception ex)
        {
            return 0;
            //log ex.Message;
            throw;
        }

    }

    #endregion

    #region Consultation Management

    public static List<Consultation> GetConsultations()
    {
        DBContext = new HSMModelDataContext();
        List<Consultation> ConsultationList = new List<Consultation>();
        ConsultationList = DBContext.Consultations.Where(b => b.IsDeleted == false).ToList();
        return ConsultationList;
    }
    public static List<Consultation> GetConsultationsListByPatientID(int PatientID)
    {
        DBContext = new HSMModelDataContext();
        List<Consultation> ConsultationList = new List<Consultation>();
        ConsultationList = DBContext.Consultations.Where(b => b.IsDeleted == false && b.PatientID == PatientID).ToList();
        return ConsultationList;
    }
    public static Consultation GetConsultationByID(int ConsultationID)
    {
        DBContext = new HSMModelDataContext();
        Consultation Consultation = new Consultation();
        Consultation = DBContext.Consultations.Where(b => b.ConsultationID == ConsultationID).FirstOrDefault();
        return Consultation;
    }
    public static List<Consultation> GetConsultationListByConsultantID(int ConsultantID)
    {
        DBContext = new HSMModelDataContext();
        List<Consultation> Consultation = new List<Consultation>();
        Consultation = DBContext.Consultations.Where(b => b.IsDeleted == false && b.ConsultationID == ConsultantID).ToList();
        return Consultation;
    }
    public static int AddNewConsultation(Consultation newConsultation)
    {
        try
        {
            DBContext = new HSMModelDataContext();
            int responce;
            newConsultation.ConsultantID = GetCurrentUserSessionID();
            newConsultation.CreatedByID = GetCurrentUserSessionID();
            newConsultation.CreatedDate = DateTime.Now;
            DBContext.Consultations.Add(newConsultation);
            responce = DBContext.SaveChanges();
            return responce;
        }
        catch (Exception ex)
        {
            return 0;
            //log ex.Message;
            throw;
        }

    }
    public static int UpdateConsultation(Consultation UpdateConsultation)
    {
        try
        {
            DBContext = new HSMModelDataContext();
            int responce;
            Consultation Consultation = DBContext.Consultations.Where(u => u.ConsultationID == UpdateConsultation.ConsultationID).FirstOrDefault();

            //DBContext.Roles.Add(newRole);
            //Consultation.ConsultationID = UpdateConsultation.ConsultationName;
            //Consultation.ConsultantID= GetCurrentUserSessionID();
            Consultation.ModifiedByID = GetCurrentUserSessionID();
            Consultation.ModifiedDate = DateTime.Now;
            responce = DBContext.SaveChanges();
            return responce;
        }
        catch (Exception ex)
        {
            return 0;
            //log ex.Message;
            throw;
        }

    }
    public static int DeleteConsultationByID(int DeleteConsultationID)
    {
        try
        {
            DBContext = new HSMModelDataContext();
            int responce;
            Consultation Consultation = DBContext.Consultations.Where(r => r.ConsultationID == DeleteConsultationID).FirstOrDefault();
            Consultation.ModifiedByID = GetCurrentUserSessionID();
            Consultation.ModifiedDate = DateTime.Now;
            Consultation.IsDeleted = true;
            responce = DBContext.SaveChanges();
            return responce;
        }
        catch (Exception ex)
        {
            return 0;
            //log ex.Message;
            throw;
        }

    }

    #endregion

    #region Authentication

    public static bool VefiryNewCreateUserName(string Username)
    {
        DBContext = new HSMModelDataContext();
        int User = 0;// new AuthUser();
        User = DBContext.AuthUsers.Where(u => u.UserName == Username).Count();
        if (User > 0)
        {
            return false;
        }
        else
        {
            return true;
        }
    }
    public static int VefiryLoginDetail(string Username, string Password)
    {
        DBContext = new HSMModelDataContext();
        AuthUser User = new AuthUser();
        User = DBContext.AuthUsers.Where(u => u.UserName == Username).FirstOrDefault();

        if (!(User == null))
        {
            if (User.IsDeleted == false)
            {
                if (User.IsActive == true)
                {
                    int Failedlogin = User.FailedLoginCount;
                    if (Failedlogin <= 3)
                    {
                        if (ValidatePassword(Password, User.Password))
                        {
                            //Save current user to session
                            return (int)LoginMessage.success;
                        }
                        else
                        {
                            User.FailedLoginCount = (Failedlogin + 1);
                            DBContext.SaveChanges();
                            return (int)LoginMessage.invalidedetail;
                           
                        }
                    }                    
                    else
                    {
                        User.IsActive = false;
                        DBContext.SaveChanges();
                        return (int)LoginMessage.accountlocked;
                    }
                }
                else
                {
                    return (int)LoginMessage.inactive;
                }
            }
            else
            {
                return (int)LoginMessage.deleted;
            }
            

        }
        
        return (int)LoginMessage.deleted;
    }
    public static void CreateUserSession(string Username)
    {
        HttpContext context = HttpContext.Current;
        context.Session["UserDetail"]=GetUserByUsername(Username);      
    }
    public static int GetCurrentUserSessionID()
    {
        HttpContext context = HttpContext.Current;
        AuthUser CurrentUser = new AuthUser();
        CurrentUser = (AuthUser)(context.Session["UserDetail"]);
        if (!(CurrentUser == null))
        {
            return CurrentUser.UserID;
        }
        else
        {
            return 0;
        }    
    }
    public static AuthUser GetCurrentUserSessionDetail()
    {
        HttpContext context = HttpContext.Current;
        AuthUser CurrentUser = new AuthUser();
        CurrentUser = (AuthUser)(context.Session["UserDetail"]);
        if (!(CurrentUser == null))
        {
            return CurrentUser;
        }
        else
        {
            return null;
        }
    }
    public static string GetCurrentUserSessionRole()
    {
        DBContext = new HSMModelDataContext();
        HttpContext context = HttpContext.Current;
        AuthUser CurrentUser = new AuthUser();
        CurrentUser = (AuthUser)(context.Session["UserDetail"]);
        if (!(CurrentUser == null))
        {
            return DBContext.AuthRoles.Where(r=> r.RoleID== CurrentUser.StaffRoleID).FirstOrDefault().RoleName;
        }
        else
        {
            return null;
        }
    }
    public static void EndCurrentSession()
    {

        HttpContext context = HttpContext.Current;        
        context.Session["UserDetail"] = null;

    }
    public static bool VerifyUserPassword(string DBPassword,string VerfiyPassword)
    {
        if (ValidatePassword(VerfiyPassword, DBPassword))
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    #endregion

    #region Utility

    //private static void EmployeeAddNurse(List<Employee> Employeelist,Nurse nurse)
    //{
    //    Employee newEmployee = new Employee()
    //    {
    //        StaffID = nurse.NurseID,
    //        StaffType = "Nurse",
    //        FirstName = nurse.FirstName,
    //        LastName = nurse.LastName,
    //        OtherNames = nurse.OtherNames,
    //        FullName = nurse.FullName,
    //        Gender = nurse.Gender,
    //        PhoneNumber = nurse.PhoneNumber,
    //        Address = nurse.Address,
    //        DOB = nurse.DOB,
    //        DateEmployed = nurse.DateEmployed,
    //        CreatedByID = nurse.CreatedByID,
    //        ModifiedByID = nurse.ModifiedByID,
    //        CreatedDate = nurse.CreatedDate,
    //        ModifiedDate = nurse.ModifiedDate,
    //        IsActive = nurse.IsActive,
    //        IsDeleted = nurse.IsDeleted
    //    };

    //    Employeelist.Add(newEmployee);
    //}

    //private static void EmployeeAddDoctor(List<Employee> Employeelist, Doctor doctor)
    //{
    //    Employee newEmployee = new Employee()
    //    {
    //        StaffID = doctor.DoctorID,
    //        StaffType = "doctor",
    //        FirstName = doctor.FirstName,
    //        LastName = doctor.LastName,
    //        OtherNames = doctor.OtherNames,
    //        FullName = doctor.FullName,
    //        Gender = doctor.Gender,
    //        PhoneNumber = doctor.PhoneNumber,
    //        Address = doctor.Address,
    //        DOB = doctor.DOB,
    //        DateEmployed = doctor.DateEmployed,
    //        CreatedByID = doctor.CreatedByID,
    //        ModifiedByID = doctor.ModifiedByID,
    //        CreatedDate = doctor.CreatedDate,
    //        ModifiedDate = doctor.ModifiedDate,
    //        IsActive = doctor.IsActive,
    //        IsDeleted = doctor.IsDeleted
    //    };

    //    Employeelist.Add(newEmployee);
    //}


    public static int GetStaffLastAttendanceID(int currentstaffid)
    {
        DBContext = new HSMModelDataContext();
        NurseDuty Nurseduty= DBContext.NurseDuties.Where(nd => nd.NurseID == currentstaffid).LastOrDefault();

        if(Nurseduty != null)
        {
            return Nurseduty.NurseDutyID;
        }
        else
        {
            return 0;
        }

        
    }

    //ddlSubject.DataSource = subjects;
    //        ddlSubject.DataTextField = "SubjectNamne";
    //        ddlSubject.DataValueField = "SubjectID";
    //        ddlSubject.DataBind();

    public enum LoginMessage
    {
        success = 100,
        invalidedetail = 101, // "Invalide Username and Password",
        accountlocked = 102,//102= "User Logged Out Kindly Contact the Administrator",
        inactive = 103,   //103= "Account is inactive kinly contact the adminstrator",
        deleted = 104//104= "Bad Request- Account does not exist"
    }
    private static string GetMd5Hash(MD5 md5Hash, string input)
    {

        // Convert the input string to a byte array and compute the hash.
        byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));

        // Create a new Stringbuilder to collect the bytes
        // and create a string.
        StringBuilder sBuilder = new StringBuilder();

        // Loop through each byte of the hashed data 
        // and format each one as a hexadecimal string.
        for (int i = 0; i < data.Length; i++)
        {
            sBuilder.Append(data[i].ToString("x2"));
        }

        // Return the hexadecimal string.
        return sBuilder.ToString();
    }
    // Verify a hash against a string.
    private static bool VerifyMd5Hash(MD5 md5Hash, string input, string hash)
    {
        // Hash the input.
        string hashOfInput = GetMd5Hash(md5Hash, input);

        // Create a StringComparer an compare the hashes.
        StringComparer comparer = StringComparer.OrdinalIgnoreCase;

        if (0 == comparer.Compare(hashOfInput.ToUpper(), hash))
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    static bool ValidatePassword(string Password, string UserPassword)
    {
        using (MD5 md5Hash = MD5.Create())
        {
            if (VerifyMd5Hash(md5Hash, Password, UserPassword))
            {
                return true;
            }
            else
            {
                return false;
            }

        }
    }
    private static string ProtectPassword(string input)
    {
        StringBuilder sBuilder = new StringBuilder();
        using (MD5 md5Hash = MD5.Create())
        {
            byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));


            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }

            // Return the hexadecimal string. 
        }
        // Convert the input string to a byte array and compute the hash. 

        return sBuilder.ToString().ToUpper();
    }
    public enum EmployeeType : int
    {
        Nurse = 1,
        Doctor = 2
    };

    //Add Image
    
    //if (FileUpload1.HasFile)
    //        {
    //            HttpPostedFile file = FileUpload1.PostedFile;
    //Byte[] imgbyte = new Byte[file.ContentLength];
    //file.InputStream.Read(imgbyte, 0, file.ContentLength);          
    //         insert imgbyte

    //Retrieve imag
    //            byte[] bytes = (byte[])dr["image"];
    //string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
    //Image1.ImageUrl = "data:image/png;base64," + base64String;
    

    #endregion


}