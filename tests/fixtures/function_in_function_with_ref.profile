SCRIPT  tests/test_plugin/function_in_function_with_ref.vim
Sourced 1 time
Total time:   0.000103
 Self time:   0.000052

count  total (s)   self (s)
                            " Test for dict function in function (local scope).
                            "
                            " This saves a ref to keep profiling information as a workaround for
                            " https://github.com/vim/vim/issues/2350.
                            " It causes the inner functions to appear before the outer in the output.
                            
    1              0.000011 let g:refs = []
                            
    1              0.000005 function! Outer()
                              function! GetObj()
                                let obj = {}
                                function obj.func()
                                  return 1
                                endfunction
                                return obj
                              endfunction
                            
                              let obj = GetObj()
                              call obj.func()
                            
                              let g:refs += [obj]
                            endfunction
    1   0.000061   0.000010 call Outer()

FUNCTION  GetObj()
Called 1 time
Total time:   0.000014
 Self time:   0.000014

count  total (s)   self (s)
    1              0.000004     let obj = {}
    1              0.000002     function obj.func()
                                  return 1
                                endfunction
    1              0.000002     return obj

FUNCTION  1()
Called 1 time
Total time:   0.000003
 Self time:   0.000003

count  total (s)   self (s)
    1              0.000002       return 1

FUNCTION  Outer()
Called 1 time
Total time:   0.000051
 Self time:   0.000034

count  total (s)   self (s)
    1              0.000002   function! GetObj()
                                let obj = {}
                                function obj.func()
                                  return 1
                                endfunction
                                return obj
                              endfunction
                            
    1   0.000023   0.000009   let obj = GetObj()
    1   0.000008   0.000005   call obj.func()
                            
    1              0.000005   let g:refs += [obj]

FUNCTIONS SORTED ON TOTAL TIME
count  total (s)   self (s)  function
    1   0.000051   0.000034  Outer()
    1   0.000014             GetObj()
    1   0.000003             1()

FUNCTIONS SORTED ON SELF TIME
count  total (s)   self (s)  function
    1   0.000051   0.000034  Outer()
    1              0.000014  GetObj()
    1              0.000003  1()

