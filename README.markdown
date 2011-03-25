PXSimpleTableAdapter
====================

`PXSimpleTableAdapter` is a class for iOS which makes managing `UITableView`s easier.

How the classes work
---------------------

`PXSimpleTableAdapter` is geared towards managing tables which have static or data which changes very infrequently, such as Settings.app, by wrapping rows and sections in Objective-C objects, to avoid having to use enumerations or dictionaries.

The project uses three main classes:

- **`PXSimpleTableAdapter`**: This is the class which is responsible for managing a table view with data that is passed to it.
- **`PXSimpleTableSection`**: This is a wrapper for information about each section – its rows, and header/footer title (if applicable).
- **`PXSimpleTableRow`**: This is a wrapper for information about a row – its title and icon.

Although excellent for dynamic content, setting up a table view with static, pre-defined content can be tricky and rather verbose. Although I love [Fraser Speirs' technique](http://speirs.org/blog/2008/10/11/a-technique-for-using-uitableview-and-retaining-your-sanity.html) of using enumerations, using objects feels like a much cleaner method and not having to implement the `UITableViewDataSource` methods reduces code required.


Using PXSimpleTableAdapter
--------------------------

1. Lay out a `UITableView` in Interface Builder (or code<sup>*</sup>).
2. `PXSimpleTableAdapter` has a property, `tableView` which is used to point to the table you want to have the data displayed in. Either instantiate a new `PXSimpleTableAdapter` instance in Interface Builder (using an Object from the Object Library) and set the `tableView` outlet to your just laid out table view, or do this in code in your view controller.
3. Create an array of `PXSimpleTableSection` objects which represent the sections in your table view.
4. Create an array of `PXSimpleTableRow` objects (which represent reach row in your table view) for each section and set these using the `-setRows:` method on `PXSimpleTableSection`.
5. Call `-setSections:` on `PXSimpleTableAdapter` and the table will be reloaded with your data.

The project includes a demo application to see how the control can be used in more detail.

What PXSimpleTableAdapter is not
--------------------------------

`PXSimpleTableAdapter` is primarily a convenience for menu-like interfaces which happen to use a table view (such as Settings.app) where implementing all the `UITableView`(`Delegate`|`DataSource`) methods is long winded (especially if you have multiple levels of these views.

However, `PXSimpleTableAdapter` is *not* a replacement for `UITableView` and its associated delegate/data source methods. The delegation pattern works much better when displaying dynamic content.

Example code
------------

Although there is a demo project in the repository, here is a quick example of setting up some data to be displayed in the table:
    
    PXSimpleTableRow *firstRow = [PXSimpleTableRow rowWithTitle:@"First Row" icon:[UIImage imageNamed@"myImage"]];
    PXSimpleTableRow *secondRow = [PXSimpleTableRow rowWithTitle:@"Second Row" icon:[UIImage imageNamed@"anotherImage"]];

    PXSimpleTableSection *section1 = [[PXSimpleTableSection alloc] initWithRows:[NSArray arrayWithObjects:firstRow, secondRow, nil]];
    PXSimpleTableSection *section2 = ...

    [<#tableAdapter#> setSections:[NSArray arrayWithObjects:section1, section2, nil]];

<small>*if you're crazy</small>

License
=======

PXSimpleTableAdapter is licensed under the New BSD License, as detailed below (adapted from OSI http://www.opensource.org/licenses/bsd-license.php):


Copyright &copy 2011, Alex Rozanski.
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

- Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
- Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
- Neither the name of the author nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

