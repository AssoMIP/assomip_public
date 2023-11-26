# encoding: utf-8
require 'date'
require 'time'
Date::MONTHNAMES = [nil] + %w(janvier février mars avril mai juin juillet août septembre octobre novembre décembre)
Date::ABBR_MONTHNAMES = [nil] + %w(jan fév mar avr mai juin juil août sept oct nov déc)
Date::DAYNAMES = ["Dimanche", "Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi"]
Date::ABBR_DAYNAMES = ["Dim", "Lun", "Mar", "Mer", "Jeu", "Ven", "Sam"]

class Time
    alias :strftime_nolocale :strftime

    def strftime(format)
        format = format.dup
        format.gsub!(/%a/, Date::ABBR_DAYNAMES[self.wday])
        format.gsub!(/%A/, Date::DAYNAMES[self.wday])
        format.gsub!(/%b/, Date::ABBR_MONTHNAMES[self.mon])
        format.gsub!(/%B/, Date::MONTHNAMES[self.mon])
        self.strftime_nolocale(format)
    end
end
