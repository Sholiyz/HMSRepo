
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class VitalSign
    {
        public int ID { get; set; }

        public int PatientID { get; set; }

        public int? FMPatientID { get; set; }

        public int StaffID { get; set; }

        public decimal? Temprature { get; set; }

        public decimal? Pulse { get; set; }

        public decimal? Respiration { get; set; }

        public decimal? BloodPressure { get; set; }

        public decimal? Weight { get; set; }

        public decimal? Height { get; set; }

        public int CreatedByID { get; set; }

        [Column(TypeName = "date")]
        public DateTime CreatedDate { get; set; }

        [Column(TypeName = "date")]
        public DateTime? ModifiedDate { get; set; }

        public int? ModifiedByID { get; set; }
    }

