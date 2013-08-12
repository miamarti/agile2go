class UserExport
	attr_reader :user

	def initialize(user, options = {})
		@user = user		
		@options = options
	end

	def to_csv	
		CSV.generate(@options) do |csv|
      csv << headers
        @user.all.each do |user|        
        attrs = attributes_for(user)
        attrs << user.roles.first.name unless user.has_role     
        csv << attrs        
      end
    end
	end

	private

	def headers
    %w(Name Email Registered Role)
  end

  def attributes_for(user)
    [user.name, user.email, user.created_at.to_date]    
  end

end