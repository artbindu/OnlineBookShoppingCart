# Online Book Shopping Cart - Detailed Project Documentation

## 📖 Table of Contents
1. [Project Overview](#project-overview)
2. [Architecture](#architecture)
3. [Technology Stack](#technology-stack)
4. [Database Schema](#database-schema)
5. [Module Details](#module-details)
6. [File Structure](#file-structure)
7. [User Workflows](#user-workflows)
8. [Admin Workflows](#admin-workflows)
9. [Security Features](#security-features)
10. [Payment System](#payment-system)
11. [Installation Guide](#installation-guide)
12. [Known Issues & Troubleshooting](#known-issues--troubleshooting)

---

## Project Overview

**Project Name**: Online Book Shopping Cart  
**Domain**: E-commerce / Online Retail  
**Purpose**: Complete web-based solution for online book purchasing with user management, shopping cart, wishlist, multiple payment options, and admin panel for inventory management.

### Key Highlights
- Multi-user support with session management
- Dual payment system (Card & Wallet)
- Premium membership with cashback benefits
- Real-time order tracking
- ISBN-10 and ISBN-13 validation
- Category-based book browsing
- Admin dashboard for inventory control

---

## Architecture

### Application Architecture
```
┌─────────────────────────────────────────────────┐
│              Client Browser (HTML/CSS/JS)       │
└─────────────────┬───────────────────────────────┘
                  │ HTTP Request/Response
┌─────────────────▼───────────────────────────────┐
│           Apache Tomcat 9.0 Server              │
│  ┌───────────────────────────────────────────┐  │
│  │         JSP Pages (Business Logic)        │  │
│  │  ├─ User Module                           │  │
│  │  ├─ Admin Module                          │  │
│  │  └─ Payment Module                        │  │
│  └───────────────┬───────────────────────────┘  │
└──────────────────┼──────────────────────────────┘
                   │ JDBC Connection
┌──────────────────▼──────────────────────────────┐
│         Oracle Database XE (localhost:1521)     │
│  ┌────────────────────────────────────────────┐ │
│  │  Tables:                                   │ │
│  │  • ARTBINDU_BOOK_USERINFO                  │ │
│  │  • ARTBINDU_BOOK_PRODUCTINFO               │ │
│  │  • ARTBINDU_CARDDETAILS                    │ │
│  │  • ARTBINDU_ORDERDETAILS                   │ │
│  │  • ARTBINDU_BOOK_ADMIN                     │ │
│  └────────────────────────────────────────────┘ │
└─────────────────────────────────────────────────┘
```

### MVC Pattern Implementation
- **Model**: Oracle Database tables and JDBC connections
- **View**: HTML/CSS interface with JSP for dynamic content
- **Controller**: JSP pages handling business logic and request processing

---

## Technology Stack

### Frontend Technologies
| Technology | Version | Purpose |
|------------|---------|---------|
| HTML5 | - | Page structure and forms |
| CSS3 | - | Styling and layout |
| JavaScript | - | Client-side validation |
| jQuery | - | Payment form handling |

### Backend Technologies
| Technology | Version | Purpose |
|------------|---------|---------|
| JSP (JavaServer Pages) | 2.3+ | Server-side rendering |
| Java Servlets | 3.1+ | Request handling |
| JDBC | 4.2+ | Database connectivity |

### Database
| Component | Details |
|-----------|---------|
| DBMS | Oracle Database Express Edition (XE) |
| Version | 11g or higher |
| Port | 1521 |
| Schema | SYSTEM |

### Server
| Component | Details |
|-----------|---------|
| Web Server | Apache Tomcat |
| Version | 9.0 |
| Default Port | 12345 (configured) |

---

## Database Schema

### 1. ARTBINDU_BOOK_USERINFO
**Purpose**: Store user account information

| Column Name | Data Type | Constraints | Description |
|-------------|-----------|-------------|-------------|
| MAILID | VARCHAR2(100) | PRIMARY KEY | User email (login ID) |
| PASSWORD | VARCHAR2(50) | NOT NULL | User password (plain text) |
| NAME | VARCHAR2(100) | NOT NULL | User full name |
| ADDRESS | VARCHAR2(500) | - | Delivery address |
| PINCODE | VARCHAR2(10) | - | Postal code |
| PHONENO | VARCHAR2(15) | UNIQUE | Contact number |
| WALLET | NUMBER(10,2) | DEFAULT 0 | Wallet balance |
| PREMIUM_USER | VARCHAR2(5) | DEFAULT 'No' | Premium status (Yes/No) |
| COUNT_ORDER | NUMBER(10) | DEFAULT 0 | Total orders placed |
| DOB | DATE | - | Date of birth |
| CART | VARCHAR2(4000) | - | Space-separated ISBN13 values |
| WISHLIST | VARCHAR2(4000) | - | Space-separated ISBN13 values |

### 2. ARTBINDU_BOOK_PRODUCTINFO
**Purpose**: Store book inventory details

| Column Name | Data Type | Constraints | Description |
|-------------|-----------|-------------|-------------|
| ISBN10 | VARCHAR2(20) | UNIQUE | 10-digit ISBN |
| ISBN13 | VARCHAR2(20) | PRIMARY KEY | 13-digit ISBN |
| TITLE | VARCHAR2(500) | NOT NULL | Book title |
| PUBLICATION | VARCHAR2(200) | - | Publisher name |
| AUTHOR | VARCHAR2(500) | - | Author name(s) |
| EDITION | VARCHAR2(50) | - | Book edition |
| LANGUAGE | VARCHAR2(50) | - | Book language |
| DIMENSION | VARCHAR2(100) | - | Physical dimensions |
| PRICE | NUMBER(10,2) | NOT NULL | Book price (INR) |
| CATEGORIES | VARCHAR2(100) | - | Main category |
| SUB_CATEGORIES | VARCHAR2(100) | - | Sub-category |
| RATING | NUMBER(3,2) | DEFAULT 0 | User rating (0-5) |
| COVER | VARCHAR2(500) | - | Cover image path |

### 3. ARTBINDU_CARDDETAILS
**Purpose**: Store user payment card information

| Column Name | Data Type | Constraints | Description |
|-------------|-----------|-------------|-------------|
| USER_ID | VARCHAR2(100) | FOREIGN KEY | References MAILID |
| CARD_NUMBER | VARCHAR2(20) | NOT NULL | Card number |
| CARD_HOLDER_NAME | VARCHAR2(100) | NOT NULL | Cardholder name |
| CVV | VARCHAR2(5) | NOT NULL | CVV code |
| EXPIRY_DATE | VARCHAR2(10) | NOT NULL | Expiry (MM/YY) |
| BANK_NAME | VARCHAR2(100) | - | Issuing bank |

### 4. ARTBINDU_ORDERDETAILS
**Purpose**: Store order transaction history

| Column Name | Data Type | Constraints | Description |
|-------------|-----------|-------------|-------------|
| ORDER_ID | VARCHAR2(100) | PRIMARY KEY | Unique order ID |
| USER_ID | VARCHAR2(100) | FOREIGN KEY | User email |
| PRODUCTS | VARCHAR2(4000) | - | Ordered ISBN13 list |
| TOTAL_ITEMS | NUMBER(5) | - | Number of items |
| TOTAL_PRICE | NUMBER(10,2) | - | Total amount |
| PAYMENT_MODE | VARCHAR2(20) | - | Card/Wallet |
| ORDER_DATE | TIMESTAMP | - | Order timestamp |
| ORDER_STATUS | VARCHAR2(50) | - | Processing/Delivered |
| DELIVERY_ADDRESS | VARCHAR2(500) | - | Shipping address |
| PINCODE | VARCHAR2(10) | - | Delivery PIN |
| PHONE_NUMBER | VARCHAR2(15) | - | Contact number |
| CASHBACK | NUMBER(10,2) | DEFAULT 0 | Premium cashback |

### 5. ARTBINDU_BOOK_ADMIN
**Purpose**: Admin account and statistics

| Column Name | Data Type | Constraints | Description |
|-------------|-----------|-------------|-------------|
| ADMIN_ID | VARCHAR2(50) | PRIMARY KEY | Admin username |
| PASSWORD | VARCHAR2(50) | NOT NULL | Admin password |
| TOTAL_BOOKS | NUMBER(10) | DEFAULT 0 | Total books in inventory |

---

## Module Details

### 1. Authentication & User Management Module

#### Files:
- **index.html**: User login interface
- **validate.jsp**: Login credential verification
- **signup.html/jsp**: New user registration
- **forgetPassword.html**: Password recovery
- **setpassword.jsp**: Password reset
- **changePassowrd.jsp**: Change existing password
- **security.jsp**: Security question setup
- **checkprofilesecurity.jsp**: Security verification
- **userlogout.jsp**: Session termination

#### Key Features:
- Email-based login system
- Password validation
- Session management with user ID and name
- Security question recovery mechanism
- Profile security check before sensitive operations

#### Workflow:
```
User Login → validate.jsp → Session Creation → userhome.jsp
    ↓ (failed)
Retry / Signup / Forget Password
```

### 2. Product Browsing & Search Module

#### Files:
- **userhome.jsp**: Main dashboard with search
- **searchingBookResult.jsp**: Search results display
- **bookcategory.jsp**: Category filtering
- **fetchBook.jsp**: Individual book details
- **showproductimage.jsp**: Book cover display

#### Key Features:
- Text-based search by book title
- Category-wise book filtering
- Book details with author, price, dimensions
- Cover image display
- Dynamic result pagination (4 books per row)

#### Search Logic:
```sql
SELECT * FROM PRODUCTINFO WHERE TITLE LIKE '%searchterm%'
```

### 3. Shopping Cart Module

#### Files:
- **addtocart.jsp**: Add book to cart
- **usershoppingcart.jsp**: View cart contents
- **usershoppingcart_modify.jsp**: Update cart (remove items)
- **clearcart.jsp**: Empty entire cart

#### Key Features:
- Multi-item cart management
- Real-time price calculation
- Quantity display per book
- Remove individual items
- Total price summary
- Item counter

#### Data Storage:
Cart items stored as space-separated ISBN13 values in CART column:
```
CART = "9781234567890 9780987654321 9781122334455"
```

### 4. Wishlist Module

#### Files:
- **addtowishlist.jsp**: Add book to wishlist
- **userwishlist.jsp**: View wishlist
- **userwishlist_modify.jsp**: Remove from wishlist

#### Key Features:
- Save books for future purchase
- Move items from wishlist to cart
- Remove items from wishlist
- View saved book details

### 5. Payment Processing Module

#### Files:
- **userproductbuy.jsp**: Checkout page
- **cardpayment.jsp**: Card payment interface
- **cardvalidation.jsp**: Card verification
- **cardvalidationHiddenData.jsp**: Hidden card data processing
- **chaking_card_details.jsp**: Card details validation
- **walletpayment.jsp**: Wallet payment processing
- **paymentconfirmation.jsp**: Payment success
- **chakingpaymentconfirm.jsp**: Payment verification

#### Payment Options:

**A. Card Payment**
- Debit/Credit card support
- Card number validation
- CVV verification
- Expiry date check
- Card holder name verification

**B. Wallet Payment**
- Pre-loaded wallet balance
- Instant payment
- Cashback credited to wallet
- Insufficient balance check

**C. Hybrid Payment**
- Partial wallet + partial card payment
- Automatic balance calculation

#### Payment Flow:
```
Cart → userproductbuy.jsp → Select Payment Mode
           ↓                           ↓
    Card Payment                 Wallet Payment
           ↓                           ↓
    cardvalidation.jsp           walletpayment.jsp
           ↓                           ↓
         Payment Confirmation
           ↓
    Order Creation → Order Details
```

### 6. Wallet Management Module

#### Files:
- **userwallet.jsp**: Wallet dashboard
- **addcash.jsp**: Add money interface
- **addcash1.jsp**: Cash addition processing
- **modifiedwallet.jsp**: Wallet update operations

#### Key Features:
- View current balance
- Add money to wallet
- Transaction history
- Premium cashback tracking
- Wallet payment option

### 7. Order Management Module

#### Files:
- **orderstatus.jsp**: Order status tracking
- **userorderdetails.jsp**: Complete order history
- **ordertableimport.jsp**: Order data import
- **autogenerate_orderid.jsp**: Order ID generation
- **paymentconfirmation.jsp**: Confirmation page

#### Order ID Format:
```java
// Format: YYYYMMDDHHMMSS + PhoneNumber
// Example: 20260103143025_9876543210
```

#### Key Features:
- Unique order ID generation
- Order history display
- Order status tracking
- Delivery address management
- Order item details
- Cashback calculation for premium users

### 8. Premium Membership Module

#### Files:
- **premium_entry.jsp**: Premium signup form
- **premium_verification.jsp**: Premium verification
- **offer.jsp**: Premium offers display

#### Benefits:
- 10% cashback on every purchase
- Welcome bonus (₹50)
- Special offers
- Priority customer support

#### Verification Process:
```
User Request → Verify Phone & Password → 
Check Single Account → Grant Premium Status → 
Add Welcome Bonus → Confirmation
```

### 9. Profile Management Module

#### Files:
- **userprofile.jsp**: View profile
- **usereditprofile.jsp**: Edit profile details
- **userprofileupdatesms.jsp**: Update confirmation
- **usermenu.html**: Navigation menu

#### Editable Fields:
- Name
- Address
- Pincode
- Phone number
- Date of birth
- Password

### 10. Admin Module

#### Files:
- **administrator/index.html**: Admin login
- **administrator/admin_validation.jsp**: Admin authentication
- **administrator/admin_connection.jsp**: Admin DB connection
- **administrator/BookImportDetails.html**: Book upload form
- **administrator/book_insert.jsp**: Insert book to DB
- **administrator/admin_book_import.jsp**: Bulk import
- **administrator/check_ISBN10.jsp**: ISBN-10 validation
- **administrator/check_ISBN13.jsp**: ISBN-13 validation

#### Admin Functions:
1. **Add New Books**
   - ISBN-10 and ISBN-13 input
   - Title, author, publisher details
   - Price, category, sub-category
   - Book dimensions (Length × Width × Height)
   - Cover image upload
   - Edition and language

2. **ISBN Validation**
   - ISBN-10: 10-digit format check
   - ISBN-13: 13-digit format check
   - Duplicate ISBN prevention

3. **Inventory Management**
   - Total books counter
   - Category management
   - Book details update

4. **Admin Dashboard**
   - Separate admin login
   - Secure admin credentials
   - Book statistics

---

## File Structure

```
OnlineBookShoppingCart/
│
├── README.md                           # Quick reference documentation
├── PROJECT_DETAILS.md                  # This detailed documentation
│
└── OnlineShoppingCart/                 # Main application folder
    │
    ├── index.html                      # User login page
    ├── signup.html                     # Registration form
    ├── signup.jsp                      # Registration processing
    ├── validate.jsp                    # Login authentication
    ├── userhome.jsp                    # User dashboard
    ├── usermenu.html                   # Navigation menu
    ├── userlogout.jsp                  # Logout handler
    ├── DBconnection.jsp                # Database connection
    ├── styles.css                      # Main stylesheet
    │
    ├── Authentication/
    │   ├── forgetPassword.html         # Password recovery form
    │   ├── setpassword.jsp             # Password reset
    │   ├── changePassowrd.jsp          # Change password
    │   ├── security.jsp                # Security questions
    │   └── checkprofilesecurity.jsp    # Security verification
    │
    ├── Shopping/
    │   ├── searchingBookResult.jsp     # Search results
    │   ├── bookcategory.jsp            # Category filter
    │   ├── fetchBook.jsp               # Book details
    │   ├── showproductimage.jsp        # Image display
    │   ├── addtocart.jsp               # Add to cart
    │   ├── usershoppingcart.jsp        # View cart
    │   ├── usershoppingcart_modify.jsp # Modify cart
    │   ├── clearcart.jsp               # Clear cart
    │   ├── addtowishlist.jsp           # Add to wishlist
    │   ├── userwishlist.jsp            # View wishlist
    │   └── userwishlist_modify.jsp     # Modify wishlist
    │
    ├── Payment/
    │   ├── userproductbuy.jsp          # Checkout page
    │   ├── cardpayment.jsp             # Card payment
    │   ├── cardvalidation.jsp          # Card verification
    │   ├── cardvalidationHiddenData.jsp
    │   ├── chaking_card_details.jsp    # Card check
    │   ├── DebitCard.jsp               # Debit card handling
    │   ├── walletpayment.jsp           # Wallet payment
    │   ├── paymentconfirmation.jsp     # Confirmation
    │   └── chakingpaymentconfirm.jsp   # Payment verify
    │
    ├── Wallet/
    │   ├── userwallet.jsp              # Wallet dashboard
    │   ├── addcash.jsp                 # Add money form
    │   ├── addcash1.jsp                # Add money process
    │   └── modifiedwallet.jsp          # Wallet update
    │
    ├── Orders/
    │   ├── orderstatus.jsp             # Order status
    │   ├── userorderdetails.jsp        # Order history
    │   ├── ordertableimport.jsp        # Order import
    │   └── autogenerate_orderid.jsp    # ID generator
    │
    ├── Profile/
    │   ├── userprofile.jsp             # View profile
    │   ├── usereditprofile.jsp         # Edit profile
    │   ├── userprofileupdatesms.jsp    # Update SMS
    │   └── check_USERID.jsp            # User ID check
    │
    ├── Premium/
    │   ├── premium_entry.jsp           # Premium signup
    │   ├── premium_verification.jsp    # Premium verify
    │   ├── offer.jsp                   # Offers display
    │   └── middlepagesms.jsp           # Message display
    │
    ├── administrator/                  # Admin module
    │   ├── index.html                  # Admin login
    │   ├── admin_validation.jsp        # Admin auth
    │   ├── admin_connection.jsp        # Admin DB
    │   ├── BookImportDetails.html      # Upload form
    │   ├── book_insert.jsp             # Insert book
    │   ├── admin_book_import.jsp       # Bulk import
    │   ├── check_ISBN10.jsp            # ISBN-10 check
    │   └── check_ISBN13.jsp            # ISBN-13 check
    │
    ├── assets/                         # Static resources
    │   ├── css/
    │   │   ├── demo.css
    │   │   └── styles.css
    │   ├── js/
    │   │   └── jquery.payform.min.js
    │   └── images/
    │
    ├── books_cover/                    # Book cover images
    ├── img/                            # Application images
    │   ├── logo2.png
    │   ├── background2.png
    │   ├── noResult.png
    │   └── money/
    │
    ├── help/                           # Help resources
    ├── ico/                            # Icons
    │
    └── problems.txt                    # Known issues log
```

---

## User Workflows

### 1. New User Registration
```
1. Open index.html
2. Click "sign up" link
3. Fill registration form (signup.html):
   - Email ID
   - Password
   - Name
   - Address
   - Pincode
   - Phone Number
   - Date of Birth
4. Submit → signup.jsp processes
5. Redirect to index.html for login
```

### 2. User Login
```
1. Enter email and password
2. Click "login" button
3. validate.jsp authenticates
4. Session created with userid and uname
5. Redirect to userhome.jsp
```

### 3. Book Search & Purchase
```
1. Login → userhome.jsp
2. Enter book name in search box
3. searchingBookResult.jsp displays results
4. Click on book → fetchBook.jsp shows details
5. Add to Cart → addtocart.jsp
6. View Cart → usershoppingcart.jsp
7. Proceed to Buy → userproductbuy.jsp
8. Choose payment method:
   a. Card → cardpayment.jsp
   b. Wallet → walletpayment.jsp
9. Payment confirmation
10. Order created → userorderdetails.jsp
```

### 4. Wishlist Management
```
1. Browse books
2. Click "Add to Wishlist" → addtowishlist.jsp
3. View Wishlist → userwishlist.jsp
4. Options:
   - Move to Cart
   - Remove from Wishlist → userwishlist_modify.jsp
```

### 5. Premium Membership Activation
```
1. Navigate to premium_entry.jsp
2. Enter:
   - Secret ID (email)
   - User ID (email)
   - Phone Number
   - Password
3. Submit → premium_verification.jsp
4. Verification checks:
   - Phone number uniqueness
   - Password match
5. Premium activated
6. ₹50 welcome bonus added to wallet
```

### 6. Wallet Top-up
```
1. Navigate to userwallet.jsp
2. Click "Add Cash"
3. Enter amount → addcash.jsp
4. Card verification
5. Amount added → modifiedwallet.jsp
6. Updated balance displayed
```

### 7. Order Tracking
```
1. Click "Order Details" in menu
2. userorderdetails.jsp displays:
   - Order ID
   - Order Date
   - Total Items
   - Total Price
   - Payment Mode
   - Order Status
   - Delivery Address
3. View detailed order information
```

---

## Admin Workflows

### 1. Admin Login
```
1. Navigate to administrator/index.html
2. Enter admin credentials
3. admin_validation.jsp authenticates
4. Access admin dashboard
```

### 2. Add New Book
```
1. Open BookImportDetails.html
2. Fill book details:
   - ISBN-10 → check_ISBN10.jsp validates
   - ISBN-13 → check_ISBN13.jsp validates
   - Title
   - Author
   - Publisher
   - Edition
   - Language
   - Category & Sub-category
   - Price
   - Dimensions (L × W × H)
   - Cover image path
3. Submit → book_insert.jsp
4. Book added to ARTBINDU_BOOK_PRODUCTINFO
5. TOTAL_BOOKS counter incremented
```

### 3. ISBN Validation
```
ISBN-10 Validation:
- Check 10-digit format
- Verify uniqueness in database

ISBN-13 Validation:
- Check 13-digit format
- Verify uniqueness in database
- Prevent duplicates
```

---

## Security Features

### 1. Authentication Security
- Session-based authentication
- Password stored (Note: Plain text - security concern)
- Session timeout on logout
- User ID verification

### 2. Authorization
- Separate user and admin login systems
- Session validation on each page
- Role-based access control (User vs Admin)

### 3. Data Validation
- Email format validation
- Phone number uniqueness check
- ISBN format verification
- Card number validation
- CVV verification
- Expiry date check

### 4. SQL Injection Concerns
**Current Status**: Vulnerable to SQL injection
```jsp
// Example vulnerable code:
String q2="select * from "+db_user+" where mailid='"+uid+"' and password='"+pass+"'";
```

**Recommendation**: Use PreparedStatement for all queries
```jsp
PreparedStatement pst = con.prepareStatement("SELECT * FROM ? WHERE mailid=? AND password=?");
pst.setString(1, db_user);
pst.setString(2, uid);
pst.setString(3, pass);
```

### 5. Security Improvements Needed
- [ ] Implement password hashing (BCrypt/SHA-256)
- [ ] Use PreparedStatements to prevent SQL injection
- [ ] Add HTTPS support
- [ ] Implement CSRF tokens
- [ ] Add input sanitization
- [ ] Session fixation protection
- [ ] Implement rate limiting for login attempts
- [ ] Add XSS protection

---

## Payment System

### Payment Architecture

```
                    User Cart
                        ↓
                 Calculate Total
                        ↓
              ┌─────────┴─────────┐
              ↓                   ↓
        Wallet Payment       Card Payment
              ↓                   ↓
    Check Wallet Balance   Card Validation
              ↓                   ↓
     Deduct from Wallet   Process Card Payment
              ↓                   ↓
              └─────────┬─────────┘
                        ↓
              Order ID Generation
                        ↓
            Save to ORDERDETAILS
                        ↓
              Update User CART → Empty
                        ↓
         Calculate Premium Cashback (10%)
                        ↓
           Add Cashback to Wallet
                        ↓
             Payment Confirmation
```

### Card Payment Details
- **Supported Cards**: Debit and Credit cards
- **Required Information**:
  - Card Number (16 digits)
  - Card Holder Name
  - CVV (3-4 digits)
  - Expiry Date (MM/YY)
  - Bank Name

### Wallet System
- **Initial Balance**: ₹0
- **Add Money**: Via card payment
- **Usage**: Direct payment for books
- **Cashback**: Credited for premium users (10%)
- **Premium Welcome Bonus**: ₹50

### Hybrid Payment
```
Total Price: ₹500
Wallet Balance: ₹300
Card Payment: ₹200
```

### Order ID Generation
```java
Format: YYYYMMDDHHMMSS + PhoneNumber
Example: 20260103143025_9876543210

Components:
- Date: 2026-01-03
- Time: 14:30:25
- Phone: 9876543210
```

---

## Installation Guide

### Prerequisites
1. **JDK Installation**
   - Download JDK 8 or higher
   - Set JAVA_HOME environment variable
   - Add to PATH

2. **Oracle Database XE**
   - Download Oracle Database Express Edition
   - Install and configure
   - Default port: 1521
   - Create tables using provided schema

3. **Apache Tomcat 9.0**
   - Download from Apache Tomcat official site
   - Extract to desired location
   - Configure port (default: 8080, project uses: 12345)

4. **Oracle JDBC Driver**
   - Download ojdbc.jar
   - Place in Tomcat lib folder or project WEB-INF/lib

### Database Setup

```sql
-- Connect as SYSTEM user
sqlplus system/123456@localhost:1521/XE

-- 1. Create User Info Table
CREATE TABLE ARTBINDU_BOOK_USERINFO (
    MAILID VARCHAR2(100) PRIMARY KEY,
    PASSWORD VARCHAR2(50) NOT NULL,
    NAME VARCHAR2(100) NOT NULL,
    ADDRESS VARCHAR2(500),
    PINCODE VARCHAR2(10),
    PHONENO VARCHAR2(15) UNIQUE,
    WALLET NUMBER(10,2) DEFAULT 0,
    PREMIUM_USER VARCHAR2(5) DEFAULT 'No',
    COUNT_ORDER NUMBER(10) DEFAULT 0,
    DOB DATE,
    CART VARCHAR2(4000),
    WISHLIST VARCHAR2(4000)
);

-- 2. Create Product Info Table
CREATE TABLE ARTBINDU_BOOK_PRODUCTINFO (
    ISBN10 VARCHAR2(20) UNIQUE,
    ISBN13 VARCHAR2(20) PRIMARY KEY,
    TITLE VARCHAR2(500) NOT NULL,
    PUBLICATION VARCHAR2(200),
    AUTHOR VARCHAR2(500),
    EDITION VARCHAR2(50),
    LANGUAGE VARCHAR2(50),
    DIMENSION VARCHAR2(100),
    PRICE NUMBER(10,2) NOT NULL,
    CATEGORIES VARCHAR2(100),
    SUB_CATEGORIES VARCHAR2(100),
    RATING NUMBER(3,2) DEFAULT 0,
    COVER VARCHAR2(500)
);

-- 3. Create Card Details Table
CREATE TABLE ARTBINDU_CARDDETAILS (
    USER_ID VARCHAR2(100),
    CARD_NUMBER VARCHAR2(20) NOT NULL,
    CARD_HOLDER_NAME VARCHAR2(100) NOT NULL,
    CVV VARCHAR2(5) NOT NULL,
    EXPIRY_DATE VARCHAR2(10) NOT NULL,
    BANK_NAME VARCHAR2(100),
    CONSTRAINT FK_USER_CARD FOREIGN KEY (USER_ID) 
        REFERENCES ARTBINDU_BOOK_USERINFO(MAILID)
);

-- 4. Create Order Details Table
CREATE TABLE ARTBINDU_ORDERDETAILS (
    ORDER_ID VARCHAR2(100) PRIMARY KEY,
    USER_ID VARCHAR2(100),
    PRODUCTS VARCHAR2(4000),
    TOTAL_ITEMS NUMBER(5),
    TOTAL_PRICE NUMBER(10,2),
    PAYMENT_MODE VARCHAR2(20),
    ORDER_DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ORDER_STATUS VARCHAR2(50) DEFAULT 'Processing',
    DELIVERY_ADDRESS VARCHAR2(500),
    PINCODE VARCHAR2(10),
    PHONE_NUMBER VARCHAR2(15),
    CASHBACK NUMBER(10,2) DEFAULT 0,
    CONSTRAINT FK_USER_ORDER FOREIGN KEY (USER_ID) 
        REFERENCES ARTBINDU_BOOK_USERINFO(MAILID)
);

-- 5. Create Admin Table
CREATE TABLE ARTBINDU_BOOK_ADMIN (
    ADMIN_ID VARCHAR2(50) PRIMARY KEY,
    PASSWORD VARCHAR2(50) NOT NULL,
    TOTAL_BOOKS NUMBER(10) DEFAULT 0
);

-- Insert default admin
INSERT INTO ARTBINDU_BOOK_ADMIN VALUES ('artbindu', 'admin123', 0);
COMMIT;
```

### Application Configuration

1. **Update DBconnection.jsp**
```jsp
<%
    String db_user= "ARTBINDU_BOOK_USERINFO";
    String db_product="ARTBINDU_BOOK_PRODUCTINFO";
    String userBanks="ARTBINDU_CARDDETAILS";
    String db_order="ARTBINDU_ORDERDETAILS";
    
    try {
        Class.forName("oracle.jdbc.OracleDriver");  
        con=DriverManager.getConnection(
            "jdbc:oracle:thin:@localhost:1521:XE",
            "system",
            "your_password"  // Update with your password
        );    
    } catch(Exception e) {
        out.println("Exception: " + e);
    }
%>
```

2. **Update admin_connection.jsp** (same as above)

3. **Configure Tomcat Server**
   - Open `Tomcat9w.exe` (Windows Service)
   - Set port to 12345 in `server.xml`:
   ```xml
   <Connector port="12345" protocol="HTTP/1.1"
              connectionTimeout="20000"
              redirectPort="8443" />
   ```

### Deployment Steps

1. **Create WAR file structure**
```
onlinebookshoppingcart.war
└── OnlineShoppingCart/
    ├── *.jsp files
    ├── *.html files
    ├── WEB-INF/
    │   ├── web.xml
    │   └── lib/
    │       └── ojdbc.jar
    ├── assets/
    ├── books_cover/
    └── img/
```

2. **Deploy to Tomcat**
   - Copy project folder to `Tomcat/webapps/`
   - Or create WAR and deploy via Tomcat Manager
   - Start Tomcat service

3. **Verify Deployment**
   - Open browser
   - Navigate to: `http://localhost:12345/onlinebookshoppingcart/OnlineShoppingCart/index.html`
   - Test login/signup functionality

### Access URLs

**User Portal**:
```
http://localhost:12345/onlinebookshoppingcart/OnlineShoppingCart/index.html
```

**Admin Portal**:
```
http://localhost:12345/onlinebookshoppingcart/OnlineShoppingCart/administrator/index.html
```

---

## Known Issues & Troubleshooting

### Issue 1: Maximum Sessions Exceeded
```
Error: ORA-00604: error occurred at recursive SQL level 1
       ORA-00018: maximum number of sessions exceeded
```

**Cause**: Too many concurrent database connections  
**Solution**:
```sql
-- Check current sessions
SELECT COUNT(*) FROM v$session;

-- Increase session limit
ALTER SYSTEM SET SESSIONS=500 SCOPE=SPFILE;
ALTER SYSTEM SET PROCESSES=400 SCOPE=SPFILE;

-- Restart Oracle Database
shutdown immediate
startup
```

### Issue 2: Closed Connection
```
Error: java.sql.SQLException: Closed Connection
```

**Cause**: Connection not properly managed  
**Solution**:
- Implement connection pooling (Apache Commons DBCP)
- Ensure connections are closed in finally blocks
- Use try-with-resources for auto-closing

```jsp
try (Connection con = DriverManager.getConnection(url, user, pass);
     Statement stmt = con.createStatement()) {
    // Use connection
} catch (SQLException e) {
    // Handle exception
}
```

### Issue 3: TNS Service Handler Not Found
```
Error: ORA-12519, TNS: no appropriate service handler found
```

**Cause**: Connection pool exhausted  
**Solution**:
```sql
-- Check processes limit
SHOW PARAMETER PROCESSES;

-- Increase processes
ALTER SYSTEM SET PROCESSES=200 SCOPE=SPFILE;

-- Restart database
```

### Issue 4: Tomcat Port Already in Use
```
Error: Address already in use: bind
```

**Solution**:
- Change port in `server.xml`
- Or kill process using the port:
```cmd
netstat -ano | findstr :12345
taskkill /PID <process_id> /F
```

### Issue 5: JDBC Driver Not Found
```
Error: java.lang.ClassNotFoundException: oracle.jdbc.OracleDriver
```

**Solution**:
- Download `ojdbc.jar`
- Place in `Tomcat/lib/` or `WEB-INF/lib/`
- Restart Tomcat

### Performance Optimization

1. **Database Indexing**
```sql
CREATE INDEX idx_user_mailid ON ARTBINDU_BOOK_USERINFO(MAILID);
CREATE INDEX idx_product_isbn13 ON ARTBINDU_BOOK_PRODUCTINFO(ISBN13);
CREATE INDEX idx_product_title ON ARTBINDU_BOOK_PRODUCTINFO(TITLE);
CREATE INDEX idx_order_userid ON ARTBINDU_ORDERDETAILS(USER_ID);
```

2. **Connection Pooling Configuration**
```xml
<!-- context.xml -->
<Resource name="jdbc/BookStore"
          auth="Container"
          type="javax.sql.DataSource"
          maxTotal="100"
          maxIdle="30"
          maxWaitMillis="10000"
          username="system"
          password="123456"
          driverClassName="oracle.jdbc.OracleDriver"
          url="jdbc:oracle:thin:@localhost:1521:XE"/>
```

3. **Session Management**
```jsp
<%@ page session="true" %>
<%
    // Set session timeout (in seconds)
    session.setMaxInactiveInterval(1800); // 30 minutes
%>
```

### Security Hardening

1. **Implement Password Hashing**
```jsp
<%@ page import="java.security.MessageDigest" %>
<%
    // Hash password before storing
    MessageDigest md = MessageDigest.getInstance("SHA-256");
    byte[] hash = md.digest(password.getBytes("UTF-8"));
    String hashedPassword = Base64.getEncoder().encodeToString(hash);
%>
```

2. **Use PreparedStatements**
```jsp
<%
    PreparedStatement pst = con.prepareStatement(
        "SELECT * FROM ARTBINDU_BOOK_USERINFO WHERE MAILID=? AND PASSWORD=?"
    );
    pst.setString(1, uid);
    pst.setString(2, hashedPassword);
    ResultSet rs = pst.executeQuery();
%>
```

3. **Input Sanitization**
```jsp
<%
    String sanitizedInput = request.getParameter("input")
        .replaceAll("[^a-zA-Z0-9@. ]", "");
%>
```

### Testing Checklist

- [ ] User registration with valid data
- [ ] User login with correct credentials
- [ ] Search functionality
- [ ] Add to cart
- [ ] Add to wishlist
- [ ] Card payment processing
- [ ] Wallet payment processing
- [ ] Order creation
- [ ] Premium membership activation
- [ ] Admin login
- [ ] Admin add book
- [ ] ISBN validation
- [ ] Session timeout handling
- [ ] Error message display
- [ ] Database connection handling

---

## Future Enhancements

### Recommended Features
1. **User Reviews & Ratings**
   - Allow users to rate and review books
   - Display average ratings

2. **Email Notifications**
   - Order confirmation emails
   - Shipping updates
   - Password reset emails

3. **Advanced Search**
   - Filter by author, price range, category
   - Sort by price, rating, popularity

4. **Recommendation Engine**
   - Based on purchase history
   - Similar books suggestions

5. **Coupon System**
   - Discount codes
   - Promotional offers

6. **Order Tracking**
   - Real-time order status
   - Shipment tracking integration

7. **Multiple Addresses**
   - Save multiple delivery addresses
   - Select address during checkout

8. **Book Availability**
   - Stock management
   - Out of stock notifications

9. **Social Login**
   - Google OAuth
   - Facebook Login

10. **Mobile Responsive Design**
    - Bootstrap framework
    - Mobile-friendly UI

### Technical Improvements
- Migrate from JSP to Spring Boot
- Implement REST APIs
- Add React/Angular frontend
- Use connection pooling (HikariCP)
- Implement caching (Redis)
- Add logging framework (Log4j)
- Unit testing (JUnit)
- Integration testing
- CI/CD pipeline
- Docker containerization

---

## Contact & Support

**Project Owner**: Biswasindhu Mandal  
**Repository**: OnlineBookShoppingCart  
**Technology**: JSP, Oracle DB, Apache Tomcat

For issues and feature requests, refer to the repository issue tracker.

---
