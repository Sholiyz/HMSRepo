
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class HSMModelDataContext : DbContext
    {
        public HSMModelDataContext()
            : base("name=HSMModelDataContext")
        {
        }

        public virtual DbSet<AttendanceLog> AttendanceLogs { get; set; }
        public virtual DbSet<AuthRole> AuthRoles { get; set; }
        public virtual DbSet<AuthUser> AuthUsers { get; set; }
        public virtual DbSet<Billing> Billings { get; set; }
        public virtual DbSet<Consultation> Consultations { get; set; }
        public virtual DbSet<DutyType> DutyTypes { get; set; }
        public virtual DbSet<Employee> Employees { get; set; }
        public virtual DbSet<FamilyMember> FamilyMembers { get; set; }
        public virtual DbSet<HospitalInfo> HospitalInfoes { get; set; }
        public virtual DbSet<NurseDuty> NurseDuties { get; set; }
        public virtual DbSet<Nurse> Nurses { get; set; }
        public virtual DbSet<PatientPlanType> PatientPlanTypes { get; set; }
        public virtual DbSet<Patient> Patients { get; set; }
        public virtual DbSet<StaffType> StaffTypes { get; set; }
        public virtual DbSet<TransactionType> TransactionTypes { get; set; }
        public virtual DbSet<VitalSign> VitalSigns { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<AttendanceLog>()
                .Property(e => e.ClockInTime)
                .HasPrecision(0);

            modelBuilder.Entity<AttendanceLog>()
                .Property(e => e.ClockOutTime)
                .HasPrecision(0);

            modelBuilder.Entity<Billing>()
                .Property(e => e.BillingID)
                .IsUnicode(false);

            modelBuilder.Entity<Billing>()
                .Property(e => e.BillingCost)
                .HasPrecision(19, 4);

            modelBuilder.Entity<DutyType>()
                .Property(e => e.StartTime)
                .HasPrecision(0);

            modelBuilder.Entity<DutyType>()
                .Property(e => e.EndTime)
                .HasPrecision(0);

            modelBuilder.Entity<Employee>()
                .Property(e => e.Gender)
                .IsUnicode(false);

            modelBuilder.Entity<FamilyMember>()
                .Property(e => e.Gender)
                .IsUnicode(false);

            modelBuilder.Entity<HospitalInfo>()
                .Property(e => e.PhoneNumber)
                .IsFixedLength();

            modelBuilder.Entity<Nurse>()
                .Property(e => e.Gender)
                .IsUnicode(false);

            modelBuilder.Entity<Patient>()
                .Property(e => e.Gender)
                .IsUnicode(false);

            modelBuilder.Entity<Patient>()
                .Property(e => e.MaritalStatus)
                .IsUnicode(false);

            modelBuilder.Entity<Patient>()
                .Property(e => e.Occupation)
                .IsFixedLength();

            modelBuilder.Entity<VitalSign>()
                .Property(e => e.Temprature)
                .HasPrecision(4, 2);

            modelBuilder.Entity<VitalSign>()
                .Property(e => e.Pulse)
                .HasPrecision(4, 2);

            modelBuilder.Entity<VitalSign>()
                .Property(e => e.Respiration)
                .HasPrecision(4, 2);

            modelBuilder.Entity<VitalSign>()
                .Property(e => e.BloodPressure)
                .HasPrecision(4, 2);

            modelBuilder.Entity<VitalSign>()
                .Property(e => e.Weight)
                .HasPrecision(4, 2);

            modelBuilder.Entity<VitalSign>()
                .Property(e => e.Height)
                .HasPrecision(4, 2);
        }
    }
