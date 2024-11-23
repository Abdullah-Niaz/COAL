.data
    prompt:      .asciiz "Enter a sentence: "
    not_pal:     .asciiz "The sentence is NOT a palindrome.\n"
    is_pal:      .asciiz "The sentence IS a palindrome.\n"
    input:       .space  256       # Reserve space for the input (max 256 characters)
    clean_input: .space  256       # Space for cleaned and lowercased input

.text
.globl main

main:
    # Prompt the user for input
    li      $v0, 4              # syscall: print_string
    la      $a0, prompt
    syscall

    # Read user input
    li      $v0, 8              # syscall: read_string
    la      $a0, input
    li      $a1, 256            # Max 256 characters
    syscall

    # Convert to lowercase and remove non-alphanumeric
    la      $t0, input          # Pointer to the original input
    la      $t1, clean_input    # Pointer to cleaned input

lowercase_and_clean:
    lb      $t2, 0($t0)         # Load a byte from the input
    beq     $t2, 0, check_palindrome # If null-terminator, end of input

    # Convert uppercase to lowercase if necessary
    li      $t3, 65             # ASCII value of 'A'
    li      $t4, 90             # ASCII value of 'Z'
    blt     $t2, $t3, skip_case_convert
    bgt     $t2, $t4, skip_case_convert
    addi    $t2, $t2, 32        # Convert to lowercase by adding 32

skip_case_convert:
    # Check if character is alphanumeric
    li      $t5, 97             # ASCII value of 'a'
    li      $t6, 122            # ASCII value of 'z'
    li      $t7, 48             # ASCII value of '0'
    li      $t8, 57             # ASCII value of '9'

    # Check if character is a lowercase letter or a digit
    blt     $t2, $t5, check_digit
    bgt     $t2, $t6, skip_add  # If not a lowercase letter, skip
    j       add_to_clean

check_digit:
    blt     $t2, $t7, skip_add
    bgt     $t2, $t8, skip_add

add_to_clean:
    sb      $t2, 0($t1)         # Store the cleaned character
    addi    $t1, $t1, 1         # Move to the next position in cleaned string

skip_add:
    addi    $t0, $t0, 1         # Move to the next character in input
    j       lowercase_and_clean

# Null-terminate the cleaned string
check_palindrome:
    sb      $zero, 0($t1)

    # Check if the cleaned input is a palindrome
    la      $t0, clean_input    # Start of cleaned string
    sub     $t1, $t1, 1         # Move $t1 back to the last valid character

check_loop:
    lb      $t2, 0($t0)         # Load character from start
    lb      $t3, 0($t1)         # Load character from end
    beq     $t2, $t3, continue_check # If they match, continue
    j       not_palindrome

continue_check:
    addi    $t0, $t0, 1         # Move start pointer forward
    subi    $t1, $t1, 1         # Move end pointer backward
    blt     $t0, $t1, check_loop # Continue until pointers meet

    # If we finish the loop, it's a palindrome
    li      $v0, 4              # syscall: print_string
    la      $a0, is_pal
    syscall
    j       end_program

not_palindrome:
    li      $v0, 4              # syscall: print_string
    la      $a0, not_pal
    syscall

end_program:
    li      $v0, 10             # syscall: exit
    syscall
