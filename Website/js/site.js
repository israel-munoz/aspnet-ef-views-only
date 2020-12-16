/**
 * @typedef User
 * @property { Number } id
 * @property { String } username
 * @property { String } email
 * @property { String } name
 * @property { Date } birthdate
 */

/** @type { HTMLSelectElement } */
const dbSelect = document.querySelector('#databases');
/** @type { HTMLButtonElement } */
const usersButton = document.querySelector('#load-users');
/** @type { HTMLElement } */
const gridSection = document.querySelector('.grid');
/** @type { HTMLTableSectionElement } */
const usersGrid = document.querySelector('#users-grid tbody');

usersButton.addEventListener('click', loadUsers);
loadDbs();

/**
 * Load users from database.
 * @param { MouseEvent } evt
 * @returns undefined;
 */
function loadUsers(evt) {
    evt.preventDefault();
    gridSection.classList.add('loading');
    usersGrid.innerHTML = '';
    const db = dbSelect.value;
    if (db) {
        request(`api/databases/${db}/users`)
            .then(fillUsersGrid)
            .catch(err => {
                alert(err);
                gridSection.classList.remove('loading');
            });
    } else {
        alert('Select a database');
    }
}

/**
 * Populate users table.
 * @param { User[] } usrs
 * @returns undefined
 */
function fillUsersGrid(usrs) {
    gridSection.classList.remove('loading');
    usrs.forEach(usr => {
        const tr = document.createElement('tr');
        const username = document.createElement('td');
        const email = document.createElement('td');
        const name = document.createElement('td');
        const birthdate = document.createElement('td');

        tr.dataset.id = usr.userId;
        username.textContent = usr.username;
        email.textContent = usr.email;
        name.textContent = usr.name;
        if (usr.birthdate) {
            const b = new Date(usr.birthdate);
            birthdate.textContent = `${b.getDate()}/${b.getMonth() + 1}/${b.getFullYear()}`;
        }
        tr.appendChild(username);
        tr.appendChild(email);
        tr.appendChild(name);
        tr.appendChild(birthdate);
        usersGrid.appendChild(tr);
    });
}

/**
 * Retrieve databases from API.
 * @returns undefined
 */
function loadDbs() {
    request('api/databases')
        .then(fillDbSelect)
        .catch(err => alert(err));
}

/**
 * Populates database dropdown.
 * @param { String[] } dbs
 */
function fillDbSelect(dbs) {
    dbSelect.innerHTML = '<option value="">Select a database</option>';
    dbs.forEach(db => {
        const op = document.createElement('option');
        op.textContent = db;
        op.value = db;
        dbSelect.appendChild(op);
    });
}

/**
 * Makes a Fetch request.
 * @param { String } url
 * @returns { Promise<Object> }
 */
function request(url) {
    return fetch(url)
        .then(r => {
            if (r.status === 200) {
                return r.json();
            } else {
                return r.json().then(t => { throw Error(t.message); });
            }
        });
}
