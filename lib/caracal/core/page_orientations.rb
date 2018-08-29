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
            width, height =
              if orient == 'portrait'
                [12240, 15840]
              else
                [15840, 12240]
              end
            return if page_orientation == orient
            self.page_width = width
            self.page_height = height
            self.page_orientation = orient
          end

          def end_turning(options = {})
            orient = options[:orient] || 'portrait'
            model     = Caracal::Core::Models::PageOrientationModel.new(orient: orient)
            contents << model
            if page_orientation != model.orient
              self.page_width = model.width
              self.page_height = model.height
              self.page_orientation = model.orient
            end
            model
          end

        end
      end
    end

  end
end
