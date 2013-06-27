class Sprint < ActiveRecord::Base
  before_validation :generate_slug
  has_many :tasks   
  belongs_to :project        
  attr_accessible :daily_scrum, :end_date, :goal, :name, :start_date, :project_id, :slug
  validates_presence_of :daily_scrum, :end_date, :goal, :name, :start_date, :project_id  

  def generate_slug
    self.slug ||= name.parameterize
  end

  def to_param
    slug    
  end

  private

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << %w(Id name Start Date End Date Daily Project Registered)
        all.each do |sprint|
        csv << [sprint.id, sprint.name, sprint.start_date.to_date, sprint.end_date.to_date, sprint.daily_scrum, sprint.project.name, sprint.created_at.to_date]
      end
    end
  end

end
