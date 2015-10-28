class Product < ActiveRecord::Base
	include ActionView::Helpers::DateHelper
	translates :title, :description
	has_and_belongs_to_many :traits
	belongs_to :collaborator
	has_many :orders
	has_many :customers, through: :orders
	has_many :images
	accepts_nested_attributes_for :images, :allow_destroy => true

	#before_destroy :ensure_not_referenced_by_any_line_item

	validates :title_kr, :title_en, :description_en, :description_kr, :minbuy, presence: true
	validates :price, numericality: {greater_than_or_equal_to: 1}
	validates :minbuy, numericality: {greater_than_or_equal_to: 1}
	validates :title_kr, :title_en, uniqueness: true
	has_attached_file :explainer, styles: {
    standard: '533x585>'
    }

   # Validate the attached image is image/jpg, image/png, etc
   validates_attachment_content_type :explainer, :content_type => /\Aimage\/.*\Z/

   process_in_background :explainer


	def time_left
    time = (self.end_date - Time.now)

    if time <= 0
      return I18n.t('completed')
    else
      return distance_of_time_in_words(Time.now, self.end_date)
      end
    end

	def progress
		prog = (self.orders.count.to_f / self.minbuy.to_f)*100
		prog.round
	end

	#def time_remaining
	#	view_context.distance_of_time_in_words(Time.now, self.end_date )
	#end

	private

	 def ensure_not_referenced_by_any_line_item
	 	if line_items.empty?
	 		return true
	 	else
	 		errors.add(:base, 'Line Items present')
	 		return false
	 	end
	 end
end
