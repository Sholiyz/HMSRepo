
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Consultation
    {
        public int ConsultationID { get; set; }

        public int PatientID { get; set; }

        public int ConsultantID { get; set; }

        public string Symptums { get; set; }

        public string Diagnosis { get; set; }

        public string Prescription { get; set; }

        public string Note { get; set; }

        public int ConsultationForID { get; set; }

        public string Notes { get; set; }

        public int CreatedByID { get; set; }

        public int? ModifiedByID { get; set; }

        [Column(TypeName = "date")]
        public DateTime CreatedDate { get; set; }

        [Column(TypeName = "date")]
        public DateTime? ModifiedDate { get; set; }

        public bool IsDeleted { get; set; }
    }

