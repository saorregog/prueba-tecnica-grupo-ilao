# Frontend Technical Test

Technical test conducted for candidates applying for the Frontend Developer position.

### Objective

To create the layout (HTML and TailwindCSS) and implement the filter functionality in JavaScript for the following prototype.

[View Prototype](https://www.figma.com/proto/BrGlZUi7JuPD4QeQPTpEk1/Frontend-Test?node-id=73-303&node-type=frame&t=VkF95nAL8XPPOSHB-1&scaling=scale-down&content-scaling=fixed&page-id=0%3A1&starting-point-node-id=73%3A303&show-proto-sidebar=1 "Prototype")

[View Design File](https://www.figma.com/design/BrGlZUi7JuPD4QeQPTpEk1/Frontend-Test?m=auto&t=rLB5lIKk9OtSA0Uf-1 "Design File")

### Filter Functionality

Please consider the following requirements to implement the filter functionality:
* Clicking the filter button opens a modal with the filter options.
* Multiple options can be selected.
* When an option is selected, the clear button is activated, and the number of selected options is displayed on the filter button.
* Clicking the filter button closes the modal and displays the products that meet the selected filters.
* Clicking the clear button removes the selected options from the filter form and reloads the list with all options.
* There are three filter options: `Rubia (id=1)`, `Morena (id=2)`, and `Roja (id=3)`.

### Technical Requirements

* Use TailwindCSS to create the styles, compile them locally, and add them to the project. (Only the structure and configuration of TailwindCSS will be reviewed).
* JavaScript must be written in ES6, and the use of third-party libraries is restricted except for [Alpine.js](https://alpinejs.dev/) and [Htmx.js](https://htmx.org/).
* To build the product list, use the `products.json` file located in this repository.

### Responsive Design

The given prototype is designed for mobile; although there is no desktop version, it must be responsive. For example, on desktop screens, the product grid can change to 4 columns.

### Resources

* In the `app/static/img` folder, you will find the product images.
* In the `templates/svg` folder, you will find the icons.

### Bonus

Completing one or all of the following points will earn extra credit when grading the test results:
* If the page is reloaded with filters applied, those filters should be retained.

## Running

### Python Packages
We use [rye](https://rye.astral.sh/) for Python packages. Follow the installation instructions [here](https://rye.astral.sh/guide/installation/#installing-rye).

After installation, run the following commands:

```bash
rye sync
rye run python manage.py runserver
```

### JavaScript Packages
We use [npm](https://www.npmjs.com/) for JavaScript packages. Follow the installation instructions [here](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm).

After installation, run the following command:

```bash
npm install
rye run python manage.py tailwind start
```

## Running with Docker

```bash
docker compose build
docker compose up
```

You should be able to access to the homepage at <http://localhost:8000/>

## Tech Stack

### Django

We use Django, a high-level Python web framework, as the foundation of our web application. Django provides a robust and scalable architecture, allowing us to quickly develop and deploy our prototype. Its modular design and extensive library of third-party packages make it an ideal choice for building complex web applications.

### Tailwind CSS

Tailwind CSS is a utility-first CSS framework that allows us to write more concise and maintainable CSS code. We use Tailwind to style our application, leveraging its pre-defined classes and utility functions to quickly create a visually appealing and responsive user interface.

### Alpine.js

Alpine.js is a lightweight JavaScript framework that provides a simple and intuitive way to create interactive web applications. We use Alpine to add dynamic behavior to our application, such as conditional rendering and event handling.

### HTMX

HTMX is a modern JavaScript library that provides a set of tools for building interactive web applications. We use HTMX to create reusable, modular components that can be easily composed together to build complex user interfaces. HTMX's focus on simplicity and ease of use makes it an ideal choice for building fast and efficient web applications.

### Rye

Rye is a Python package that provides a set of tools for building and deploying web applications. We use Rye to manage our application's dependencies, configure our environment, and run our application in development and production modes. Rye's simplicity and flexibility make it an ideal choice for building and deploying web applications.
