module Achiever
  module CoreExt
    module Class

      def basename
        name.split("::").last
      end

    end
  end
end

Class.send(:include, Achiever::CoreExt::Class)