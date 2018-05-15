
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

        public virtual DbSet<AuthRole> AuthRoles { get; set; }
        public virtual DbSet<AuthUser> AuthUsers { get; set; }
        public virtual DbSet<Billing> Billings { get; set; }
        public virtual DbSet<Consultation> Consultations { get; set; }
        public virtual DbSet<Doctor> Doctors { get; set; }
        public virtual DbSet<DutyType> DutyTypes { get; set; }
        public virtual DbSet<FamilyMember> FamilyMembers { get; set; }
        public virtual DbSet<NurseDuty> NurseDuties { get; set; }
        public virtual DbSet<Nurse> Nurses { get; set; }
        public virtual DbSet<PatientPlanType> PatientPlanTypes { get; set; }
        public virtual DbSet<Patient> Patients { get; set; }
        public virtual DbSet<TrasactionType> TrasactionTypes { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Billing>()
                .Property(e => e.BillingID)
                .IsUnicode(false);

            modelBuilder.Entity<Billing>()
                .Property(e => e.BillingCost)
                .HasPrecision(19, 4);

            modelBuilder.Entity<Doctor>()
                .Property(e => e.Gender)
                .IsUnicode(false);

            modelBuilder.Entity<DutyType>()
                .Property(e => e.StartTime)
                .HasPrecision(0);

            modelBuilder.Entity<DutyType>()
                .Property(e => e.EndTime)
                .HasPrecision(0);

            modelBuilder.Entity<FamilyMember>()
                .Property(e => e.Gender)
                .IsUnicode(false);

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
        }
    }

