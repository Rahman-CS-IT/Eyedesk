<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!--Custom CSS Link-->
    <link
      rel="stylesheet"
      href="<?php echo base_url() ?>/public/assets/css/navbar.css"
    />

    <link
      href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css"
      rel="stylesheet"
    />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css"
      rel="stylesheet"
    />

    <link
      rel="stylesheet"
      href="<?php echo base_url() ?>/public/lib/main.css"
    />
    <link
      rel="stylesheet"
      href="<?php echo base_url() ?>/public/assets/css/opd_navbar.css"
      type="text/css"
    />
    <link
      rel="stylesheet"
      href="<?php echo base_url() ?>/public/assets/css/navbar.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.4.0/fullcalendar.css"
    />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  </head>

  <body>
    <nav class="navbar">
      <div class="logo">
        <a href="<?= base_url('/doctor-dashboard') ?>"
          ><img
            src="<?php echo base_url() ?>/public/assets/image/logo.png"
            alt=""
            width="42px"
        /></a>
      </div>

      <!--Nav Link Start-->
      <div class="links">
        <ul>
          <li>
            <a href="<?= base_url('opd') ?>"
              ><img
                src="<?php echo base_url() ?>/public/assets/image/opd.png"
                alt="opd"
              />
              <p>OPD</p>
            </a>
          </li>
          <li>
            <a href="#"
              ><img
                src="<?php echo base_url() ?>/public/assets/image/ipd.png"
                alt="opd"
              />
              <p>IPD</p>
            </a>
          </li>
          <li>
            <a href="#"
              ><img
                src="<?php echo base_url() ?>/public/assets/image/ot.png"
                alt="opd"
              />
              <p>OT</p>
            </a>
          </li>
          <li>
            <a href="#"
              ><img
                src="<?php echo base_url() ?>/public/assets/image/stores.png"
                alt="opd"
              />
              <p>Stores</p>
            </a>
          </li>
        </ul>
      </div>
      <!--Nav Link End-->

      <!--Search Bar Start-->
      <div class="search-bar">
        <p class="search-bar__button" onclick="addPatientToggle();">
          Add Patient
        </p>
        <input
          type="text"
          class="search-bar__input"
          placeholder="Search by ID"
        />
        <img
          src="<?php echo base_url() ?>/public/assets/image/search-icon.png"
          alt="searchicon"
        />
      </div>
      <!--Search Bar End-->

      <!--Profile Manage Start-->
      <div class="profile">
        <div class="profile-state">
          <a
            ><img
              src="<?php echo base_url() ?>/public/assets/image/state.png"
              alt="stateicon"
            />
            <p>Set State</p>
          </a>
        </div>
        <div class="profile-hospital">
          <img
            src="<?php echo base_url() ?>/public/assets/image/hospital.png"
            alt="hospitalicon"
          />
          <select name="" id="">
            <option value="">AEH</option>
            <option value="">AEC</option>
            <option value="">SAF</option>
          </select>
        </div>
        <div class="profile-summary">
          <p>Summary</p>
        </div>
        <div class="profile-image">
          <div class="profile-image__img" onclick="profileToggle();">
            <img
              src="<?php echo base_url() ?>/public/assets/image/user.png"
              alt="userimage"
            />
          </div>

          <div class="profile-image__dropdown">
            <ul>
              <li>
                <a href="<?= base_url('Facilities') ?>">Facility settings</a>
              </li>
              <li><a href="#">Financial Settings</a></li>
              <li><a href="#">Organization Settings</a></li>
              <li><a href="#">Operation Settings</a></li>
              <li><a href="#">Inventory</a></li>
              <li><a href="<?= base_url('/logout') ?>">Logout</a></li>
            </ul>
          </div>
        </div>
      </div>
      <!--Profile Manage End-->
    </nav>

    <!--Patient Registration Start-->
    <section class="patient-registration">
      <!--Modal Start-->
      <div class="modal">
        <div class="modal__header">
          <p class="modal__header__heading">
            Patient Registration & Appointment form
          </p>
          <div class="modal-closebtn" onclick="addPatientToggle();">
            <img
              src="<?php echo base_url() ?>/public/assets/image/close.png"
              alt=""
              width="28px"
            />
          </div>
        </div>
        <!--Modal Body Start-->
        <form id="patientForm" enctype="multipart/form-data">
          <div class="modal__container">
            <div class="modal__container__left">
              <nav class="modal__container__left__header">
                <span class="modal__container__left__nav__btn active"
                  >Patient Details</span
                >
                <span class="modal__container__left__nav__btn"
                  >Other Details</span
                >
                <span class="modal__container__left__nav__btn">History</span>
                <span class="modal__container__left__nav__btn">Allergies</span>
              </nav>

              <div class="modal__container__left__body active">
                <!--Patient Details Start-->
                <div class="patientdetails">
                  <div class="patientdetails__name">
                    <div class="patientdatils__name_header">
                      <p>Name</p>
                    </div>
                    <div class="patientdetails__name_input">
                      <input
                        type="text"
                        name="firstname"
                        placeholder="First Name"
                        required
                      />
                      <input
                        type="text"
                        name="middlename"
                        placeholder="Middle Name"
                      />
                      <input
                        type="text"
                        name="last_name"
                        placeholder="Last Name"
                      />
                    </div>
                  </div>

                  <div class="patientdetails__contact">
                    <div class="patientdatils__contact_header">
                      <p>Contact Details</p>
                    </div>
                    <div class="patientdetails__contact_input">
                      <input
                        type="text"
                        name="mobilenumber"
                        placeholder="Mobile Number"
                        required
                      />
                      <input
                        type="text"
                        name="secondarynumber"
                        placeholder="Secondary Number"
                      />
                      <input type="text" name="email" placeholder="Email" />
                    </div>
                  </div>

                  <div class="patientdetails__4col">
                    <div class="patientdetails__4col_gender">
                      <div class="patientdatils__4col_gender_header">
                        <p>Gender</p>
                      </div>
                      <div class="patientdatils__4col_gender_input">
                        <div class="box">
                          <input
                            type="radio"
                            id="male"
                            value="male"
                            name="gender"
                          />
                          <p>Male</p>
                        </div>
                        <div class="box">
                          <input
                            type="radio"
                            id="female"
                            value="female"
                            name="gender"
                          />
                          <p>Female</p>
                        </div>
                        <div class="box">
                          <input
                            type="radio"
                            id="trans"
                            value="transgender"
                            name="gender"
                          />
                          <p>Transgender</p>
                        </div>
                      </div>
                    </div>

                    <div class="patientdetails__4col_dob">
                      <div class="patientdetails__4col_dob_header">
                        <p>D.O.B</p>
                      </div>
                      <div class="patientdetails__4col_dob_input">
                        <input type="date" name="dob" />
                        <div class="box">
                          <input type="text" placeholder="Years" name="year" />
                          <input
                            type="text"
                            placeholder="Months"
                            name="months"
                          />
                        </div>
                      </div>
                    </div>

                    <div class="patientdetails__4col_language">
                      <div class="patientdatils__4col_language_header">
                        <p>Language</p>
                      </div>
                      <div class="patientdatils__4col_language_input">
                        <select name="language" id="">
                          <option value="english">English</option>
                          <option value="hindi">Hindi</option>
                          <option value="marathi">Marathi</option>
                          <option value="telugu">Telugu</option>
                          <option value="tamil">Tamil</option>
                          <option value="punjabi">Punjabi</option>
                          <option value="sindhi">Sindhi</option>
                          <option value="malayalam">Malayalam</option>
                        </select>
                      </div>
                    </div>

                    <div class="patientdetails__4col_patienttype">
                      <div class="patientdatils__4col_patienttype_header">
                        <p>Patient Type</p>
                      </div>
                      <div class="patientdatils__4col_patienttype_input">
                        <select name="patienttype" id="">
                          <option value="new">New</option>
                          <option value="followup">Follow Up</option>
                          <option value="operation">Operation</option>
                        </select>
                      </div>
                    </div>
                  </div>

                  <div class="patientdetails__2col">
                    <div class="patientdetails__2col_address">
                      <div class="patientdetails__2col_address__header">
                        <p>Address</p>
                      </div>

                      <div class="patientdetails__2col_address__line1">
                        <input
                          type="text"
                          name="address1"
                          placeholder="Address 1"
                        />
                        <input
                          type="text"
                          name="address2"
                          placeholder="Address 2"
                        />
                      </div>
                      <div class="patientdetails__2col_address__line2">
                        <select name="state" id="">
                          <option value="none">-- Select State --</option>
                          <option value="maharashtra">Maharashtra</option>
                          <option value="delhi">Delhi</option>
                          <option value="uttarpradesh">Uttar Pradesh</option>
                          <option value="kerela">Kerela</option>
                          <option value="karnataka">Karnataka</option>
                          <option value="punjab">Punjab</option>
                          <option value="westbengal">West Bengal</option>
                        </select>
                        <input type="text" name="city" placeholder="City" />
                        <input
                          type="text"
                          name="pincode"
                          placeholder="Pincode"
                        />
                      </div>
                    </div>

                    <div class="patientdetails__2col__occupation">
                      <div class="patientdetails__2col__occupation__header">
                        <p>Occupation</p>
                      </div>
                      <div class="patientdetails__2col__occupation__input">
                        <select name="occupation" id="">
                          <option value="service">Service</option>
                          <option value="business">Business</option>
                          <option value="other">Other</option>
                        </select>
                        <input
                          type="text"
                          name="employeeid"
                          id=""
                          placeholder="Employee ID (If Any)"
                        />
                      </div>
                    </div>
                  </div>

                  <div class="patientdetails__1col">
                    <div class="patientdetails__1col_medicalrecord">
                      <div class="patientdetails__1col_medicalrecord__header">
                        <p>Medical Record No.</p>
                      </div>
                      <input
                        type="text"
                        name="medicalrecordno"
                        id=""
                        placeholder="Medical Record No."
                      />
                    </div>

                    <div class="patientdetails__1col_govtid">
                      <div class="patientdetails__1col_govtid__header">
                        <p>Government Issued ID</p>
                      </div>

                      <div class="patientdetails__1col_govtid_input">
                        <select name="governmentid" id="">
                          <option value="aadharcard">Aadhar Card</option>
                          <option value="voterid">Voter ID</option>
                          <option value="driverslicense">
                            Driver's License
                          </option>
                          <option value="passport">Passport</option>
                        </select>
                        <input
                          type="text"
                          name="governmentidno"
                          id=""
                          placeholder="ID goes here"
                        />
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!--Patient Details End-->

              <!--Other Details Start-->
              <div class="modal__container__left__body">
                <div class="otherdetails">
                  <div class="otherdetails__groupone">
                    <div class="otherdetails__groupone__imageupload">
                      <div class="otherdetails__groupone__imageupload__header">
                        <p>Patient Image</p>
                      </div>
                      <div class="otherdetails__groupone__imageupload__input">
                        <input
                          type="file"
                          class="file-upload-input"
                          name="image"
                        />
                      </div>
                    </div>
                    <div class="otherdetails__groupone__bloodgroup">
                      <div class="otherdetails__groupone__bloodgroup__header">
                        <p>Blood Group</p>
                      </div>
                      <div class="otherdetails__groupone__bloodgroup__input">
                        <div class="box-container">
                          <div class="box">
                            <input
                              type="radio"
                              name="blood_grp"
                              id=""
                              value="O+"
                            />
                            <p>O+</p>
                          </div>
                          <div class="box">
                            <input
                              type="radio"
                              name="blood_grp"
                              id=""
                              value="A+"
                            />
                            <p>A+</p>
                          </div>
                          <div class="box">
                            <input
                              type="radio"
                              name="blood_grp"
                              id=""
                              value="B+"
                            />
                            <p>B+</p>
                          </div>
                          <div class="box">
                            <input
                              type="radio"
                              name="blood_grp"
                              id=""
                              value="AB+"
                            />
                            <p>AB+</p>
                          </div>
                        </div>
                        <div class="box-container">
                          <div class="box">
                            <input
                              type="radio"
                              name="blood_grp"
                              id=""
                              value="O-"
                            />
                            <p>O-</p>
                          </div>
                          <div class="box">
                            <input
                              type="radio"
                              name="blood_grp"
                              id=""
                              value="A-"
                            />
                            <p>A-</p>
                          </div>
                          <div class="box">
                            <input
                              type="radio"
                              name="blood_grp"
                              id=""
                              value="B-"
                            />
                            <p>B-</p>
                          </div>
                          <div class="box">
                            <input
                              type="radio"
                              name="blood_grp"
                              id=""
                              value="AB-"
                            />
                            <p>AB-</p>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>

                  <div class="otherdetails__grouptwo">
                    <div class="otherdetails__grouptwo__box">
                      <div class="otherdetails__grouptwo__box__header">
                        <p>Marital Status</p>
                      </div>
                      <div class="otherdetails__grouptwo__box____input">
                        <div class="box">
                          <input
                            type="radio"
                            name="maritail_status"
                            id=""
                            value="single"
                          />
                          <p>Single</p>
                        </div>
                        <div class="box">
                          <input
                            type="radio"
                            name="maritail_status"
                            id=""
                            value="married"
                          />
                          <p>Married</p>
                        </div>
                      </div>
                    </div>

                    <div class="otherdetails__grouptwo__box">
                      <div class="otherdetails__grouptwo__box__header">
                        <p>One Eyed</p>
                      </div>
                      <div class="otherdetails__grouptwo__box____input">
                        <div class="box">
                          <input
                            type="radio"
                            name="one_eyed"
                            id=""
                            value="yes"
                          />
                          <p>Yes</p>
                        </div>
                        <div class="box">
                          <input
                            type="radio"
                            name="one_eyed"
                            id=""
                            value="no"
                          />
                          <p>No</p>
                        </div>
                      </div>
                    </div>
                  </div>

                  <div class="otherdetails__groupthree">
                    <div class="otherdetails__groupthree__header">
                      <p>Emergency Contact</p>
                    </div>
                    <div class="otherdetails__groupthree__input">
                      <select name="emg_relation" id="">
                        <option value="none">--Relation--</option>
                        <option value="spouse">Spouse</option>
                        <option value="parent">Parent</option>
                        <option value="sibling">Sibling</option>
                        <option value="cousin">Cousin</option>
                      </select>
                      <input
                        type="text"
                        name="emg_name"
                        id=""
                        placeholder="Name"
                      />
                      <input
                        type="text"
                        name="emg_number"
                        id=""
                        placeholder="Number"
                      />
                    </div>
                  </div>
                </div>
              </div>
              <!--Other Details End-->

              <!--History Details Start-->
              <div class="modal__container__left__body">
                <div class="history">
                  <div class="history-opthalmic">
                    <div class="history-opthalmic__header">
                      <p>Opthalmic History</p>
                    </div>

                    <div class="history-opthalmic__input">
                      <div class="history-opthalmic__input__btn">
                        <div class="history-opthalmic__input__btn-group">
                          <input
                            type="button"
                            id="glaucoma"
                            class="selectbtn"
                            name="opthalmic_type"
                            value="glaucoma"
                          />
                          <input
                            type="button"
                            id="retinal_Detachment"
                            class="selectbtn"
                            name="opthalmic_type"
                            value="Retinal Detachment"
                          />
                          <input
                            type="button"
                            id="glass_Disease"
                            class="selectbtn"
                            name="opthalmic_type"
                            value="Glass"
                          />
                          <input
                            type="button"
                            id="eye_disease"
                            class="selectbtn"
                            name="opthalmic_type"
                            value="Eye Disease"
                          />
                          <input
                            type="button"
                            id="eye_surgery"
                            class="selectbtn"
                            name="opthalmic_type"
                            value="Eye Surgery"
                          />
                          <input
                            type="button"
                            id="uveties"
                            class="selectbtn"
                            name="opthalmic_type"
                            value="Uveitis"
                          />
                          <input
                            type="button"
                            id="retinal_laser"
                            class="selectbtn"
                            name="opthalmic_type"
                            value="Retinal Laser"
                          />
                        </div>
                      </div>
                      <div id="dynamic"></div>
                      <div class="history-opthalmic__input__textarea">
                        <textarea
                          name="opthalmic_comment"
                          id=""
                          cols="100%"
                          rows="4"
                          placeholder="History Comment"
                        ></textarea>
                      </div>
                    </div>
                  </div>

                  <div class="history-systemic">
                    <div class="history-systemic__header">
                      <p>Systemic History</p>
                    </div>

                    <div class="history-systemic__input">
                      <div class="history-systemic__input__btn">
                        <div class="history-systemic__input__btn-group">
                          <input
                            class="selectbtn"
                            id="hypertension"
                            name="systemic_type"
                            value="Hypertension"
                            type="button"
                          />
                          <input
                            class="selectbtn"
                            id="diabetes"
                            name="systemic_type"
                            value="Diabetes"
                            type="button"
                          />
                          <input
                            class="selectbtn"
                            id="alcoholism"
                            name="systemic_type"
                            value="Alcoholism"
                            type="button"
                          />
                          <input
                            class="selectbtn"
                            id="smoking_Tobacco"
                            name="systemic_type"
                            value="Smoking Tobacco"
                            type="button"
                          />
                          <input
                            class="selectbtn"
                            id="cardiac_Disorder"
                            name="systemic_type"
                            value="Cardiac Disorder"
                            type="button"
                          />
                          <input
                            class="selectbtn"
                            id="drug_abuse"
                            name="systemic_type"
                            value="Drug Abuse"
                            type="button"
                          />
                          <input
                            class="selectbtn"
                            id="HIV"
                            name="systemic_type"
                            value="HIV/AIDS"
                            type="button"
                          />
                          <input
                            class="selectbtn"
                            id="cancer_tumor"
                            name="systemic_type"
                            value="Cancer Tumor"
                            type="button"
                          />
                          <input
                            class="selectbtn"
                            id="tuberculosis"
                            name="systemic_type"
                            value="Tuberculosis"
                            type="button"
                          />
                          <input
                            class="selectbtn"
                            id="asthma"
                            name="systemic_type"
                            value="Asthma"
                            type="button"
                          />
                          <input
                            class="selectbtn"
                            id="cns"
                            name="systemic_type"
                            value="CNS Disorder Stroke"
                            type="button"
                          />
                          <input
                            class="selectbtn"
                            id="hypthyrodism_Cirrhosis"
                            name="systemic_type"
                            value="Hypothyroidism"
                            type="button"
                          />
                          <input
                            class="selectbtn"
                            id="hepatitis_Cirrhosis"
                            name="systemic_type"
                            value="Hepatitis Cirrhosis"
                            type="button"
                          />
                          <input
                            class="selectbtn"
                            id="renal_disorder"
                            name="systemic_type"
                            value="Renal Disorder"
                            type="button"
                          />
                          <input
                            class="selectbtn"
                            id="acidity"
                            name="systemic_type"
                            value="Acidity"
                            type="button"
                          />
                          <input
                            class="selectbtn"
                            id="on_insilin"
                            name="systemic_type"
                            value="On Insulin"
                            type="button"
                          />
                          <input
                            class="selectbtn"
                            id="on_aspirin"
                            name="systemic_type"
                            value="On Aspirin Blood Thinners"
                            type="button"
                          />
                          <input
                            class="selectbtn"
                            id="consanguinity"
                            name="systemic_type"
                            value="Consanguinity"
                            type="button"
                          />
                          <input
                            class="selectbtn"
                            id="thyroid_Disorder"
                            name="systemic_type"
                            value="Thyroid Disorder"
                            type="button"
                          />
                          <input
                            class="selectbtn"
                            id="chewing_Tobacco"
                            name="systemic_type"
                            value="Chewing Tobacco"
                            type="button"
                          />
                          <input
                            class="selectbtn"
                            id="rheumatoid_Arthritis"
                            name="systemic_type"
                            value="Rheumatoid Arthritis"
                            type="button"
                          />
                          <input
                            class="selectbtn"
                            id="benign_Hyperplasia"
                            name="systemic_type"
                            value="Benign Prostatic Hyperplasia"
                            type="button"
                          />
                        </div>
                      </div>
                      <div id="dynamic-systemic"></div>
                      <div>
                        <table></table>
                      </div>
                      <div class="history-systemic__input__textarea">
                        <textarea
                          name="systemic_comment"
                          id=""
                          cols="100%"
                          rows="4"
                          placeholder="History Comment"
                          resize="false"
                        ></textarea>
                      </div>
                    </div>
                  </div>

                  <div class="history-medical-family">
                    <div class="box">
                      <div class="history-medical__header">
                        <p>Medical History</p>
                      </div>
                      <div class="history-medical__input">
                        <input type="text" name="medical_history" id="" />
                      </div>
                    </div>
                    <div class="box">
                      <div class="history-family__header">
                        <p>Family History</p>
                      </div>
                      <div class="history-medical__input">
                        <input type="text" name="family_history" id="" />
                      </div>
                    </div>
                  </div>

                  <div class="history-paediatric">
                    <div class="history-paediatric__header">
                      <p>Paediatric History</p>
                    </div>
                    <div class="history-paediatric__body">
                      <div class="box">
                        <div class="box-header">
                          <p>Nutrition Assessment</p>
                        </div>
                        <div class="box-body-nutrition">
                          <button class="selectbtn" type="button" id="malBtn">
                            Malnourished
                            <input
                              type="radio"
                              value="Malnourished"
                              name="paedairic_type"
                              hidden
                            />
                          </button>
                          <button class="selectbtn" type="button" id="wellBtn">
                            Well Nourished
                            <input
                              type="radio"
                              value="Well Nourished"
                              name="paedairic_type"
                              hidden
                            />
                          </button>
                          <button class="selectbtn" type="button" id="overBtn">
                            Overweight
                            <input
                              type="radio"
                              value="Overweight"
                              name="paedairic_type"
                              hidden
                            />
                          </button>
                          <button class="selectbtn" type="button" id="obsBtn">
                            Obese
                            <input
                              type="radio"
                              value="Obese"
                              name="paedairic_type"
                              hidden
                            />
                          </button>
                        </div>
                      </div>
                      <div class="box">
                        <div class="box-header">
                          <p>Comments</p>
                        </div>
                        <div class="box-body-txt">
                          <textarea
                            name="paedairic_comment"
                            id=""
                            cols="50"
                            rows="3"
                          ></textarea>
                        </div>
                      </div>
                      <div class="box">
                        <div class="box-header">
                          <p>Immunization Assessment</p>
                        </div>
                        <div class="box-body">
                          <button class="selectbtn" type="button" id="comBtn">
                            Complete
                            <input
                              type="radio"
                              value="Complete"
                              name="immunization_type"
                              hidden
                            />
                          </button>
                          <button class="selectbtn" type="button" id="penBtn">
                            Pending
                            <input
                              type="radio"
                              value="Pending"
                              name="immunization_type"
                              hidden
                            />
                          </button>
                        </div>
                      </div>
                      <div class="box">
                        <div class="box-header">
                          <p>Comments</p>
                        </div>
                        <div class="box-body-txt">
                          <textarea
                            name="immunization_comment"
                            id=""
                            cols="50"
                            rows="3"
                          ></textarea>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!--History Details End-->

              <!--Allergies Details Start-->
              <div class="modal__container__left__body">
                <div class="allergies">
                  <div class="allergies-drug">
                    <div class="allergies-drug__header">
                      <p>Drug Allergies</p>
                    </div>
                    <div class="allergies-drug__body">
                      <div class="allergies-drug__body__btn">
                        <input
                          class="selectbtn"
                          id="antimicrobial"
                          name="drug_type"
                          value="Antimicrobial Agents"
                          type="button"
                        />
                        <input
                          class="selectbtn"
                          id="antifungal_agents"
                          name="drug_type"
                          value="Antifungal Agents"
                          type="button"
                        />
                        <input
                          class="selectbtn"
                          id="antiviral_agents"
                          name="drug_type"
                          value="Antiviral Agents"
                          type="button"
                        />
                        <input
                          class="selectbtn"
                          id="nsaids_agents"
                          name="drug_type"
                          value="Nsaids"
                          type="button"
                        />
                        <input
                          class="selectbtn"
                          id="eye_drop"
                          name="drug_type"
                          value="Eye Drops"
                          type="button"
                        />
                      </div>
                      <div id="allergies"></div>
                      <div class="allergies-drug__body__textarea">
                        <textarea
                          name="drug_comment"
                          id=""
                          cols="100%"
                          rows="4"
                          placeholder="Drug Allergies Comment"
                        ></textarea>
                      </div>
                    </div>
                  </div>
                  <div class="allergies-contact">
                    <div class="allergies-contact__header">
                      <p>Contact Allergies</p>
                    </div>
                    <div class="allergies-contact__body">
                      <div class="allergies-contact__body__btn">
                        <input
                          class="selectbtn"
                          id="alcohol"
                          name="contact_type"
                          value="Alcohol"
                          type="button"
                        />
                        <input
                          class="selectbtn"
                          id="latex"
                          name="contact_type"
                          value="Latex"
                          type="button"
                        />
                        <input
                          class="selectbtn"
                          id="betadine"
                          name="contact_type"
                          value="Betadine"
                          type="button"
                        />
                        <input
                          class="selectbtn"
                          id="adhesive_tape"
                          name="contact_type"
                          value="Adhesive Tape"
                          type="button"
                        />
                        <input
                          class="selectbtn"
                          id="tegaderm"
                          name="contact_type"
                          value="Tegaderm"
                          type="button"
                        />
                        <input
                          class="selectbtn"
                          id="transpore"
                          name="contact_type"
                          value="Transpore"
                          type="button"
                        />
                      </div>
                      <div id="contact-allergies"></div>
                      <div class="allergies-contact__body__textarea">
                        <textarea
                          name="contact_comment"
                          id=""
                          cols="100%"
                          rows="4"
                          placeholder="Contact Allergies Comment"
                        ></textarea>
                      </div>
                    </div>
                  </div>
                  <div class="allergies-food">
                    <div class="allergies-food__header">
                      <p>Food Allergies</p>
                    </div>
                    <div class="allergies-food__body">
                      <div class="allergies-food__body__btn">
                        <input
                          class="selectbtn"
                          id="seafood"
                          name="food_type"
                          value="All Seafood"
                          type="button"
                        />
                        <input
                          class="selectbtn"
                          id="corn"
                          name="food_type"
                          value="Corn"
                          type="button"
                        />
                        <input
                          class="selectbtn"
                          id="egg"
                          name="food_type"
                          value="Egg"
                          type="button"
                        />
                        <input
                          class="selectbtn"
                          id="milk"
                          name="food_type"
                          value="Milk Protiens"
                          type="button"
                        />
                        <input
                          class="selectbtn"
                          id="peanuts"
                          name="food_type"
                          value="Peanuts"
                          type="button"
                        />
                        <input
                          class="selectbtn"
                          id="shellfish"
                          name="food_type"
                          value="Shellfish Only"
                          type="button"
                        />
                        <input
                          class="selectbtn"
                          id="soy"
                          name="food_type"
                          value="Soy Protien"
                          type="button"
                        />
                        <input
                          class="selectbtn"
                          id="lactose"
                          name="food_type"
                          value="Lactose"
                          type="button"
                        />
                        <input
                          class="selectbtn"
                          id="mushroom"
                          name="food_type"
                          value="Mushroom"
                          type="button"
                        />
                      </div>
                      <div id="food-allergies"></div>
                      <div class="allergies-food__body__textarea">
                        <textarea
                          name="food_comment"
                          id=""
                          cols="100%"
                          rows="4"
                          placeholder="Food Allergies Comment"
                        ></textarea>
                      </div>
                    </div>
                  </div>
                  <div class="allergies-other">
                    <p>Other Comments:</p>
                    <textarea
                      name="other_comment"
                      id=""
                      cols="40"
                      rows="2"
                    ></textarea>
                  </div>
                </div>
              </div>
              <!--Allergies Details End-->
            </div>

            <div class="modal__container__right">
              <div class="modal__container__right__header">
                <p>Appointment Details</p>
              </div>

              <div class="modal__container__right__body">
                <div class="appt-type">
                  <p>Type</p>
                  <div class="appt-type__input">
                    <input
                      type="radio"
                      name="appointment_type"
                      value="walkin"
                    />
                    <p>Walk-in</p>
                    <input
                      type="radio"
                      name="appointment_type"
                      value="appointment"
                    />
                    <p>Appointment</p>
                  </div>
                </div>

                <div class="appt-datetime">
                  <p>Appointment Date & Time</p>
                  <div class="appt-datetime__input">
                    <input type="date" class="date" name="appointment_date" />
                    <input
                      type="time"
                      value="09:00"
                      class="time"
                      name="appointment_time"
                    />
                  </div>
                </div>

                <div class="appt-location">
                  <div class="appt-location__input">
                    <p>Location</p>
                    <select name="location" id="">
                      <option value="aeh">AEH</option>
                      <option value="aec">AEC</option>
                      <option value="saf">SAF</option>
                    </select>
                  </div>
                  <div class="appt-consultant__input">
                    <p>Consultant</p>
                    <select name="consultant" id="">
                      <?php if (!empty($result)) :?>
                      <?php foreach ($result as $row):?>
                      <option value="<?= $row->name ?>">
                        <?= $row->name ?>
                      </option>
                      <?php endforeach?>
                      <?php else:?>
                      <option value="">No Doctor Available</option>
                      <?php endif?>
                    </select>
                  </div>
                </div>

                <div class="appt-types">
                  <div class="appt-types__input">
                    <p>Appointment Types</p>
                    <select name="appointment_t" id="">
                      <option value="review">Review</option>
                      <option value="walkin">Walk-In</option>
                      <option value="consultation">Consultation</option>
                      <option value="checkup">Checkup</option>
                      <option value="surgery">Surgery</option>
                    </select>
                  </div>
                  <div class="appt-categories__input">
                    <p>Categories</p>
                    <select name="appointment_category" id="">
                      <option value="none">--Select Appointment Type--</option>
                      <option value="comprehensive">Comprehensive</option>
                      <option value="routine">Routine</option>
                      <option value="lens">Contact Lens</option>
                    </select>
                  </div>
                </div>

                <p class="reservation">
                  Reserved Slot for
                  <span class="reservation_time"><?= date('d M,Y') ?></span>
                </p>
                <div class="reservation-container" onclick="slotsToggle();">
                  <table>
                    <tr>
                      <th colspan="2">9 AM</th>
                      <!-- <th>2</th> -->
                      <th colspan="2">10 AM</th>
                      <!-- <th>4</th> -->
                      <th colspan="2">11 AM</th>
                      <!-- <th>6</th> -->
                      <th colspan="2">12 PM</th>
                      <!-- <th>8</th> -->
                      <th colspan="2">1 PM</th>
                      <!-- <th>10</th> -->
                      <th colspan="2">2 PM</th>
                      <!-- <th>12</th> -->
                      <th colspan="2">3 PM</th>
                      <!-- <th>14</th> -->
                      <th colspan="2">4 PM</th>
                      <!-- <th>16</th> -->
                      <th colspan="2">5 PM</th>
                      <!-- <th>18</th> -->
                      <th colspan="2">6 PM</th>
                      <!-- <th>20</th> -->
                    </tr>
                    <tr>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td colspan="2" class="r">Reserved</td>
                      <!-- <td>5</td> -->
                      <td></td>
                      <td colspan="3" class="r">Reserved</td>
                      <!-- <td>8</td> -->
                      <!-- <td>9</td> -->
                      <td></td>
                      <td></td>
                      <td colspan="3" class="r">Reserved</td>
                      <!-- <td>13</td> -->
                      <!-- <td>14</td> -->
                      <td colspan="2" class="r">Reserved</td>
                      <!-- <td>16</td> -->
                      <td></td>
                      <td></td>
                      <td colspan="2" class="r">Reserved</td>
                      <!-- <td>20</td> -->
                      <!-- <td>22</td> -->
                    </tr>
                    <tr>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td colspan="3" class="r">Reserved</td>
                      <!-- <td>10</td> -->
                      <!-- <td>11</td> -->
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td colspan="2" class="r">Reserved</td>
                      <!-- <td>17</td> -->
                      <td></td>
                      <td></td>
                      <td></td>
                    </tr>
                  </table>

                  <div id="calendar2"></div>
                </div>
              </div>
            </div>
          </div>

          <div class="modal__createappointmentbtn">
            <button type="button" class="register-btn">
              Create Appointment
            </button>
          </div>
        </form>
        <!--Modal Body End-->
      </div>
      <!--Modal End-->
    </section>
    <!-- slots section start -->

    <!--Patient Registration End-->
    <script src="<?php echo base_url() ?>/public/lib/main.js"></script>
    <script
      defer
      src="<?php echo base_url() ?>/public/assets/js/nav.js"
      type="text/javascript"
    ></script>
    <script>
      $(document).ready(function () {


        $("#malBtn").click(function() {
          var isChecked = $("input[name='paedairic_type'][value='Malnourished']").prop("checked");
    
          // Toggle the state of the radio button
          $("input[name='paedairic_type'][value='Malnourished']").prop("checked", !isChecked);
        }); 
        $("#wellBtn").click(function() {
          var isChecked = $("input[name='paedairic_type'][value='Well Nourished']").prop("checked");
    
          // Toggle the state of the radio button
          $("input[name='paedairic_type'][value='Well Nourished']").prop("checked", !isChecked);
        }); 
        $("#overBtn").click(function() {
          var isChecked = $("input[name='paedairic_type'][value='Overweight']").prop("checked");
    
          // Toggle the state of the radio button
          $("input[name='paedairic_type'][value='Overweight']").prop("checked", !isChecked);
        }); 
        $("#obsBtn").click(function() {
          var isChecked = $("input[name='paedairic_type'][value='Obese']").prop("checked");
    
          // Toggle the state of the radio button
          $("input[name='paedairic_type'][value='Obese']").prop("checked", !isChecked);
        }); 
        $("#comBtn").click(function() {
          var isChecked = $("input[name='immunization_type'][value='Complete']").prop("checked");
    
          // Toggle the state of the radio button
          $("input[name='immunization_type'][value='Complete']").prop("checked", !isChecked);

           // Set the value of the hidden input field
  $("input[name='immunization_type'][value='Complete']").val(!isChecked ? "Complete" : "");
        }); 
        $("#penBtn").click(function() {
          var isChecked = $("input[name='immunization_type'][value='Pending']").prop("checked");
    
          // Toggle the state of the radio button
          $("input[name='immunization_type'][value='Pending']").prop("checked", !isChecked);

            // Set the value of the hidden input field
  $("input[name='immunization_type'][value='Pending']").val(!isChecked ? "Pending" : "");
        }); 
        // function to append input fields
        function appendInputs(inputID, field) {
          var capitalizedName = inputID.replace("_", " ").toUpperCase();
          var inputContainer = $(`#${field} .${inputID}`);
          // check if dynamic div has any input fields
          if (inputContainer.length == 0) {
            // create a new input container for this field and append 4 input fields
            var newInputContainer = $(`<div class="${inputID}"></div>`);
            var newInputContainerInputs = $(
              `<div class="dynamic-inputs"></div>`
            );
            newInputContainer.append(newInputContainerInputs);
            //   newInputContainerInputs.append(
            //    `<div class="dynamic-inputs"></div>`);
            newInputContainerInputs.append(
              `<label value="">${capitalizedName}</label><input type="text" hidden class="name"  value="${capitalizedName}" name="name[]" >`
            );
            //   for (var i = 1; i <= 4; i++) {
            //     newInputContainer.append(`<input type="text" class="${inputID}" name="${field}[]" placeholder="Medical Record ${inputID} ${i}">`);
            //   }
            newInputContainerInputs.append(`<select class="" name="duration[]" id="">
                                                    <option value="select" disable class="duration">Duration</option>
                                                    <option value="1" >1</option>
                                                    <option value="2" >2</option>
                                                    <option value="3" >3</option>
                                                    <option value="4" >4</option>
                                                    <option value="5" >5</option>
                                                </select>
                                                <select class="" name="duration_unit[]" class="duration_unit" id="">
                                                <option value="select" disable>Duration Unit</option>
                                                    <option value="1" >1</option>
                                                    <option value="2" >2</option>
                                                    <option value="3" >3</option>
                                                    <option value="4" >4</option>
                                                    <option value="5" >5</option>
                                                </select>`);
            newInputContainerInputs.append(
              `<input class="" name="comments[]" type="text" name="comments" placeholder="comments">`
            );

            $(`#${field}`).append(newInputContainer);
          }
          // if input container already exists, toggle its visibility
          else {
            inputContainer.toggle();
          }
        }

        $(document).on("click", ".register-btn", function (e) {
          e.preventDefault();

          var formData = new FormData($("#patientForm")[0]);
            $.ajax({
              url: '<?php echo base_url("Register");?>',
              type: "POST",
              data: formData,
              processData: false,
              contentType: false,
              dataType: "json",
              success: function (response) {
                if (response.success) {
                  Swal.fire(
                    {
                      icon: "success",
                      title: "patient Added Successfully",
                      text: "Patient ID: " + response.pat_id,
                      showConfirmButton: false,
                      timer: 2500,
                     
                    }).then(function () {
                        location.reload();
                    });
                } else {
                  alert("Error: " + response.errors);
                }
              },
              error: function () {
                alert("Error: Server Error.");
              },
            })
        
        });
        // add click event to all buttons
        $(".selectbtn").click(function () {
          var inputID = $(this).attr("id");
          var field = $(this)
            .closest(".history-opthalmic__input__btn")
            .next()
            .attr("id");
          $("#" + field).addClass("click");
          appendInputs(inputID, field);
          var field1 = $(this)
            .closest(".history-systemic__input__btn")
            .next()
            .attr("id");
          $("#" + field1).addClass("click");
          appendInputs(inputID, field1);
          var field1 = $(this)
            .closest(".allergies-drug__body__btn")
            .next()
            .attr("id");
          $("#" + field1).addClass("click");
          appendInputs(inputID, field1);
          var field1 = $(this)
            .closest(".allergies-contact__body__btn")
            .next()
            .attr("id");
          $("#" + field1).addClass("click");
          appendInputs(inputID, field1);
          var field1 = $(this)
            .closest(".allergies-food__body__btn")
            .next()
            .attr("id");
          $("#" + field1).addClass("click");
          appendInputs(inputID, field1);
        });

      });
    </script>
  </body>
</html>
