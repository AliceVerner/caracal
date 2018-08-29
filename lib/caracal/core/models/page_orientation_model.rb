require 'caracal/core/models/base_model'


module Caracal
  module Core
    module Models

      # This class encapsulates the logic needed to store and manipulate
      # page break data.
      #
      class PageOrientationModel < BaseModel

        #-------------------------------------------------------------
        # Configuration
        #-------------------------------------------------------------

        # accessors
        attr_reader :orient, :width, :height

        # initialization
        def initialize(options={}, &block)
          @orient = options[:orient]
          if @orient == 'portrait'
            @width = 12240
            @height = 15840
          else
            @width = 15840
            @height = 12240
          end

          super options, &block
        end

        #-------------------------------------------------------------
        # Public Methods
        #-------------------------------------------------------------

        #=============== SETTERS ==============================

        # def orient(value)
        #   @orient = value
        # end


        #-------------------------------------------------------------
        # Public Methods
        #-------------------------------------------------------------

        #=============== SETTERS ==============================


        #-------------------------------------------------------------
        # Private Instance Methods
        #-------------------------------------------------------------
        private

        def option_keys
          []
        end

      end

    end
  end
end
