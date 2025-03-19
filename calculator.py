"""
This module provides a CalculatorClass for performing basic mathematical
operations.
"""


class CalculatorClass(object):
    """
    A calculator class that includes methods for common calculations such as
    summation.
    """

    def sum(self, num_list):
        """
        Calculates the sum of a list of numbers.

        Args:
            num_list (list): A list of numerical values.

        Returns:
            int or float: The sum of all numbers in num_list.

        Example:
            >>> calc = CalculatorClass()
            >>> calc.sum([1, 2, 3, 4])
            10
        """
        return sum(num_list)