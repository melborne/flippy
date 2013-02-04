# Flippy

Fippy makes a text upside down, like "twitter" to "ɹəʇʇᴉʍʇ".

## Installation

Add this line to your application's Gemfile:

    gem 'flippy'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install flippy

## Usage

flippy add #flip and #unflip to String class.

    require 'flippy'
    
    flipped = "twitter".flip # => "ɹəʇʇᴉʍʇ"
    flipped.unflip # => "twitter"
    flipped_number = '1234567890'.flip # => "068L95ᔭεƧ⇂"
    flipped_number.unflip # => "1234567890"

It also add Kernel#stnd :)

    stnd "twitter" # => "ɹəʇʇᴉʍʇ"

Try on multi line string.

    code =<<CODE
    # encoding: UTF-8
    class Employee
      attr_accessor :name, :title, :department
      def initialize(name, title, department)
        @name = name
        @title = title
        @department = department
      end

      def profile
        "%s is %s at %s dept." % [name, title, department]
      end
    end

    charlie = Employee.new('Charlie', :programmer, :Game)

    puts charlie.profile
    CODE

    puts flipped = code.flip


This produce following;

                                      əlᴉɟoɹd˙əᴉlɹɐɥɔ sʇnd

     (əɯɐ⅁: ‘ɹəɯɯɐɹɓoɹd: ‘'əᴉlɹɐɥƆ')ʍəu˙əəʎoldɯƎ = əᴉlɹɐɥɔ

                                                       puə
                                                     puə  
    [ʇuəɯʇɹɐdəp ‘əlʇᴉʇ ‘əɯɐu] % "˙ʇdəp s% ʇɐ s% sᴉ s%"    
                                             əlᴉɟoɹd ɟəp  

                                                     puə  
                              ʇuəɯʇɹɐdəp = ʇuəɯʇɹɐdəp@    
                                        əlʇᴉʇ = əlʇᴉʇ@    
                                          əɯɐu = əɯɐu@    
                 (ʇuəɯʇɹɐdəp ‘əlʇᴉʇ ‘əɯɐu)əzᴉlɐᴉʇᴉuᴉ ɟəp  
                ʇuəɯʇɹɐdəp: ‘əlʇᴉʇ: ‘əɯɐu: ɹossəɔɔɐ‾ɹʇʇɐ  
                                            əəʎoldɯƎ ssɐlɔ
                                          8-Ⅎ⊥Ո :ɓuᴉpoɔuə #

Try #unflip this again, then eval it. It will work.

Flippy.table output the mapping table.

## Thank you

Thank you to Fumiaki Nishihara for disclosing a ASCII mapping table for text upside down as his blog entry;

> twitter→ɹəʇʇɪʍʇのように英数字を180度回転して表示する方法｜Colorless Green Ideas
> http://id.fnshr.info/2013/01/25/upsidedowntext/



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
