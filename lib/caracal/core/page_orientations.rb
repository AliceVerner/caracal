require 'caracal/core/models/page_orientation_model'


module Caracal
  module Core

    # This module encapsulates all the functionality related to adding page
    # breaks to the document.
    #
    module PageOrientations
      def self.included(base)
        base.class_eval do

          #-------------------------------------------------------------
          # Public Methods
          #-------------------------------------------------------------
          def start_turning(options = {})
            orient = options[:orient] || 'portrait'
            width, height, margin_top, margin_right, margin_bottom, margin_left =
              if orient == 'portrait'
                [12240, 15840, 566, 566, 566, 1133]
              else
                [15840, 12240, 1133, 566, 566, 566]
              end
            return if page_orientation == orient
            self.page_width = width
            self.page_height = height
            self.page_orientation = orient
            self.page_margin_top = margin_top
            self.page_margin_right = margin_right
            self.page_margin_bottom = margin_bottom
            self.page_margin_left = margin_left
          end

          def end_turning(options = {})
            orient = options[:orient] || 'portrait'
            model  = Caracal::Core::Models::PageOrientationModel.new(orient: orient)

            contents << model
            if page_orientation != model.orient
              self.page_width = model.width
              self.page_height = model.height
              self.page_orientation = model.orient
              self.page_margin_top = margin_top
              self.page_margin_right = margin_right
              self.page_margin_bottom = margin_bottom
              self.page_margin_left = margin_left
            end
            model
          end

        end
      end
    end

  end
end
