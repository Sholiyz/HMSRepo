using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

/// <summary>
/// Summary description for Pasture
/// </summary>
public class Pasture
{

    public static HSMModelDataContext DBContext = new HSMModelDataContext();
    public Pasture()
    {
        //
        // TODO: Add constructor logic here
        //
    }


    #region Hospital Info Management

    public static HospitalInfo GetHospitalInfo()
    {
        HospitalInfo HospitalInfo = new HospitalInfo();
        HospitalInfo = DBContext.HospitalInfoes.FirstOrDefault();
        return HospitalInfo;
    }
    
    public static int AddHospitalInfo(HospitalInfo newHospitalInfo)
    {
        try
        {
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
        List<AuthRole> RoleList = new List<AuthRole>();
        RoleList = DBContext.AuthRoles.Where(r => r.IsDeleted == false).ToList();
        return RoleList;
    }
    public static AuthRole GetRoleByID(int roleID)
    {
        AuthRole Role = new AuthRole();
        Role = DBContext.AuthRoles.Where(r => r.RoleID == roleID).FirstOrDefault();
        return Role;
    }
    public static int AddNewRole(AuthRole newRole)
    {
        try
        {
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
    public static int DeleteRoleByID(AuthRole DeleteRole)
    {
        try
        {
            int responce;
            AuthRole Role = DBContext.AuthRoles.Where(r => r.RoleID == DeleteRole.RoleID).FirstOrDefault();
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
        List<AuthUser> UserList = new List<AuthUser>();
        UserList = DBContext.AuthUsers.Where(u => u.IsDeleted == false).ToList();
        return UserList;
    }
    public static AuthUser GetUserByID(int userID)
    {
        AuthUser User = new AuthUser();
        User = DBContext.AuthUsers.Where(u => u.UserID == userID).FirstOrDefault();
        return User;
    }
    public static AuthUser GetUserByUsername(string username)
    {
        AuthUser User = new AuthUser();
        User = DBContext.AuthUsers.Where(u => u.UserName == username).FirstOrDefault();
        return User;
    }
    public static int AddNewUser(AuthUser newUser)
    {
        try
        {
            int responce;
            newUser.Password = ProtectPassword(newUser.Password).ToUpper();
            
            newUser.CreatedByID = GetCurrentUserSessionID();
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
    public static int UpdateUser(AuthUser UpdateUser)
    {
        try
        {
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
    public static int DeleteUserByID(AuthUser DeleteUser)
    {
        try
        {
            int responce;
            AuthUser User = DBContext.AuthUsers.Where(r => r.UserID == DeleteUser.UserID).FirstOrDefault();
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
        List<Patient> PatientList = new List<Patient>();
        PatientList = DBContext.Patients.Where(p => p.IsDeleted == false).ToList();
        return PatientList;
    }
    public static Patient GetPatientListByID(int patientID)
    {
        Patient Patient = new Patient();
        Patient = DBContext.Patients.Where(p => p.PatientID == patientID).FirstOrDefault();
        return Patient;
    }
    public static int AddNewPatient(Patient newpatient)
    {
        try
        {
            int responce;           
            newpatient.CreatedByID = GetCurrentUserSessionID();
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
            int responce;
            Patient patient = DBContext.Patients.Where(u => u.PatientID == UpdatePatient.PatientID).FirstOrDefault();

            //DBContext.AuthRoles.Add(newRole);         
            patient.IsActive = UpdatePatient.IsActive;
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
    public static int DeletePatientByID(Patient DeletePatient)
    {
        try
        {
            int responce;
            Patient patient = DBContext.Patients.Where(p => p.PatientID == DeletePatient.PatientID).FirstOrDefault();
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
        List<NurseDuty> NurseDutyList = new List<NurseDuty>();
        NurseDutyList = DBContext.NurseDuties.ToList();
        return NurseDutyList;
    }
    public static NurseDuty GetNurseDutyByID(int NurseDutyID)
    {
        NurseDuty NurseDuty = new NurseDuty();
        NurseDuty = DBContext.NurseDuties.Where(n => n.NurseDutyID == NurseDutyID).FirstOrDefault();
        return NurseDuty;
    }
    public static int AddNewNurseDuty(NurseDuty newNurseDuty)
    {
        try
        {
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
        List<PatientPlanType> PatientPlanList = new List<PatientPlanType>();
        PatientPlanList = DBContext.PatientPlanTypes.Where(ppt=> ppt.IsDeleted==false).ToList();
        return PatientPlanList;
    }
    public static PatientPlanType GetPatientPlanByID(int PatientPlanTypeID)
    {
        PatientPlanType PatientPlan = new PatientPlanType();
        PatientPlan = DBContext.PatientPlanTypes.Where(ppt => ppt.PlanTypeID == PatientPlanTypeID).FirstOrDefault();
        return PatientPlan;
    }
    public static int AddNewPatientPlan(PatientPlanType newPatientPlan)
    {
        try
        {
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
    public static int DeletePatientPlanByID(PatientPlanType DeletePatientPlan)
    {
        try
        {
            int responce;
            PatientPlanType PatientPlan = DBContext.PatientPlanTypes.Where(ppt => ppt.PlanTypeID == DeletePatientPlan.PlanTypeID).FirstOrDefault();
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
        List<DutyType> DutyTypeList = new List<DutyType>();
        DutyTypeList = DBContext.DutyTypes.Where(dt => dt.IsDeleted == false).ToList();
        return DutyTypeList;
    }
    public static DutyType GetDutyTypeByID(int DutyTypeID)
    {
        DutyType dutyType = new DutyType();
        dutyType = DBContext.DutyTypes.Where(dt => dt.DutyTypeID == DutyTypeID).FirstOrDefault();
        return dutyType;
    }
    public static int AddNewDutyType(DutyType newDutyType)
    {
        try
        {
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
    public static int DeleteDutyTypeByID(DutyType DeleteDutyType)
    {
        try
        {
            int responce;
            DutyType dutyType = DBContext.DutyTypes.Where(dt => dt.DutyTypeID == DeleteDutyType.DutyTypeID).FirstOrDefault();
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
        List<TransactionType> TransactionTypeList = new List<TransactionType>();
        TransactionTypeList = DBContext.TransactionTypes.Where(tranx => tranx.IsDeleted == false).ToList();
        return TransactionTypeList;
    }
    public static TransactionType GetTransactionTypeByID(int TransactionTypeID)
    {
        TransactionType TransactionType = new TransactionType();
        TransactionType = DBContext.TransactionTypes.Where(tranx => tranx.TransactionTypeID == TransactionTypeID).FirstOrDefault();
        return TransactionType;
    }
    public static int AddNewTransactionType(TransactionType newTransactionType)
    {
        try
        {
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
    public static int DeleteTransactionTypeByID(TransactionType DeleteTransactionType)
    {
        try
        {
            int responce;
            TransactionType TransactionType = DBContext.TransactionTypes.Where(tranx => tranx.TransactionTypeID == DeleteTransactionType.TransactionTypeID).FirstOrDefault();
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


    #region Authentication

    public static bool VefiryNewCreateUserName(string Username)
    {
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
        AuthUser User = new AuthUser();
        User = DBContext.AuthUsers.Where(u => u.UserName == Username).FirstOrDefault();

        if (!(User == null))
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
                    return (int)LoginMessage.invalidedetail;
                }
            }
            else
            {
                return (int)LoginMessage.accountlocked;
            }

        }
        
        return (int)LoginMessage.badrequest;
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
    public static void EndCurrentSession()
    {

        HttpContext context = HttpContext.Current;        
        context.Session["UserDetail"] = null;

    }

    #endregion

    #region Utility


    //ddlSubject.DataSource = subjects;
    //        ddlSubject.DataTextField = "SubjectNamne";
    //        ddlSubject.DataValueField = "SubjectID";
    //        ddlSubject.DataBind();

    public enum LoginMessage
    {
        success = 100,
        invalidedetail = 101, // "Invalide Username and Password",
        accountlocked = 102,//102= "User Logged Out Kindly Contact the Administrator",
        tryagain = 103,   //103= "Something Happed Kindly Try Agin",
        badrequest = 104//104= "Bad Request"
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

        if (0 == comparer.Compare(hashOfInput, hash))
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

    #endregion
}