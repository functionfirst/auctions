module ApplicationHelper
   def cp(path)
    if current_page?(path)
      "bg-gray-900 text-white"
    else
      "text-gray-300 hover:bg-gray-700 hover:text-white"
    end
   end
end
