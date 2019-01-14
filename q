
[1mFrom:[0m /home/learn/code/labs/marvel-battles/app/controllers/superpowers_controller.rb @ line 18 SuperpowersController#create:

    [1;34m15[0m: [32mdef[0m [1;34mcreate[0m
    [1;34m16[0m:   binding.pry
    [1;34m17[0m:   @superpower=[1;34;4mSuperpower[0m.create(superpower_params)
 => [1;34m18[0m:   binding.pry
    [1;34m19[0m:   @superpower.save
    [1;34m20[0m:   binding.pry
    [1;34m21[0m:   [32mif[0m @superpower.save
    [1;34m22[0m:     redirect_to superpowers_path(@superpower)
    [1;34m23[0m:   [32melse[0m
    [1;34m24[0m:     render [33m:new[0m
    [1;34m25[0m:   [32mend[0m
    [1;34m26[0m: [32mend[0m

