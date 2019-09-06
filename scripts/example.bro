# Example code from http://try.bro.org/#/trybro/saved/352183

@load policy/custom/factorial

event bro_init()
    {
    # Create the logging stream.
    Log::create_stream(Factor::LOG, [$columns=Factor::Info, $path="factor"]);
    }

event bro_done()
    {
    local numbers: vector of count = vector(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);    
    for ( n in numbers )
        Log::write( Factor::LOG, [$num=numbers[n],
                                  $factorial_num=Factor::factorial(numbers[n])]);
    }

