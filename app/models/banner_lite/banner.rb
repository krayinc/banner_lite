module BannerLite
  class Banner < ActiveRecord::Base
    attr_accessor :file

    before_save :fill_file_name, if: :file
    after_save :save_file, if: :file

    def src
      "/system/#{id}/#{file_name}"
    end

    private
      def fill_file_name
        self.file_name = file.original_filename
      end

      def save_file
        dir = Rails.root.join('public', 'system', id.to_s)
        FileUtils.mkdir(dir)
        File.open(dir + file_name, 'wb'){|f| f.write(file.read) }
      end
  end
end
