"""
This module provides a class to check if a given number is prime.
It includes a method to evaluate the primality of an integer.
"""


class PrimeClass(object):
    """
    Class to check if a number is prime.
    """

    def is_prime(self, num_int):
        """
        Determines if a number is prime.

        Args:
            num_int (int): The integer to evaluate for primality.
            Must be a whole number.

        Returns:
            bool: True if the number is prime, False otherwise.

        >>> checker = PrimeClass()
        >>> checker.is_prime(2)
            True
        >>> checker.is_prime(1)
            False
        >>> checker.is_prime(7)
            True
        >>> checker.is_prime(-5)
            False
        """
        if num_int < 2:
            return False
        for itr in range(2, int(num_int ** 0.5) + 1):
            if num_int % itr == 0:
                return False
        return True
