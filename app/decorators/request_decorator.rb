class RequestDecorator < BaseDecorator
  def formatted_date
    date.strftime("%B %d, %Y at %I:%M %p")
  end

  # Example to add a method to a nested model
  # def customer
  #   decorate(__getobj__.customer)
  # end

  # Example with inherit classes:
  # class PostDecorator < BaseDecorator
  #   def self.for(post)
  #     if post.featured?
  #       FeaturedPostDecorator
  #     else
  #       PostDecorator
  #     end
  #   end
  # end

  # class FeaturedPostDecorator < PostDecorator
  #   def display_title
  #     "FEATURED: #{super}"
  #   end
  # end
end
