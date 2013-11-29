module TherapyStuff
  ::CATEGORIES = {'pt' => {:name => 'Physical Therapist', :tj => 'Physical Therapy'},
                  'ot' => {:name => 'Occupational Therapist', :tj => 'Occupational Therapy'},
                  'slp' => {:name => 'Speech Language Pathologist', :tj => 'Speech Therapy'},
                  'pta' => {:name => 'Physical Therapy Assistant', :tj => 'Physical Therapist Assistant'},
                  'cota' => {:name => 'Certified Occupational Therapy Assistant', :tj => 'Certified Occupational Therapy Assistant'},
                  'dor' => {:name => 'Director of Rehabilitation'},
                  'rd' => {:name => 'Regional Director'},
                  'pm' => {:name => 'Program Manager'},
  }
  ::SETTINGS = {'snf' => {:name => 'Skilled Nursing Facility', :setting => 'in a skilled nursing facility', :tj => 'Nursing Facility'},
                'acute' => {:name => 'Acute Care', :setting => 'in an acute care unit', :tj => 'Hospital'},
                'ip' => {:name => 'Inpatient Rehab', :setting => 'in an inpatient rehab unit', :tj => 'Hospital'},
                'op' => {:name => 'Outpatient', :setting => 'in an outpatient clinic', :tj => 'Outpatient'},
                'hosp' => {:name => 'Hospital', :setting => 'in a hospital', :tj => 'Hospital'},
                'hh' => {:name => 'Home Health', :setting => 'with a home health agency', :tj => 'Home Health'},
                'alf' => {:name => 'Assisted Living Facility', :setting => 'in an assisted living facility', :tj => 'Assisted Living Facility'},
                'ccrc' => {:name => 'Continuing Care Retirement Community', :setting => 'in a continuing care retirement facility', :tj => 'Assisted Living Facility'},
                'agency' => {:name => 'Agency', :setting => 'with an agency', :tj => 'Agency'}
  }
end
