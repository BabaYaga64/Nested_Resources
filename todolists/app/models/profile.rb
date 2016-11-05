class Profile < ActiveRecord::Base
  belongs_to :user
  validates :gender, :inclusion => {:in => ['male', 'female']}
  validate :first_or_last  
  validate :gender_name_check

# Define custom validator that permits first_name or last_name to be null but not both
def first_or_last    
  if first_name.nil? && last_name.nil?      
   errors.add(:first_name, "Specify a first or a last.")    
  end  
end  

# Define a validation for gender to be either "male" or "female" by using a built-in validator
# Define custom validator that prevents anyone that is male (gender) from having the first_name "Sue" ;)
def gender_name_check   
  if first_name == 'Sue' && gender == 'male'      
   errors.add(:first_name, 'cannot be a boy named Sue')   
  end  
end

def self.get_all_profiles(start_year,test_year)
    Profile.where(:birth_year => start_year..test_year).order('birth_year asc')  
end

end

