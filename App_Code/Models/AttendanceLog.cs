  using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("AttendanceLog")]
    public partial class AttendanceLog
    {
        [Key]
        public int AttendanceID { get; set; }

        public int StaffID { get; set; }

        public int DutyID { get; set; }

        public TimeSpan ClockInTime { get; set; }

        public TimeSpan? ClockOutTime { get; set; }

        public DateTime AttendanceDate { get; set; }

        public bool IsLocked { get; set; }
    }

