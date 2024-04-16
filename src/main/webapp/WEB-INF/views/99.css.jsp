<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <style>
    /*input 태그*/
    .inputDivBox {
    position: relative;
    width: 300px;
    margin-left: 50px;
    margin-top: 100px;
    }

    .inputBox {
    font-size: 15px;
    color: #222222;
    width: 300px;
    border: none;
    border-bottom: solid #aaaaaa 1px;
    padding-bottom: 10px;
    padding-left: 10px;
    position: relative;
    background: none;
    z-index: 5;
    }

    .inputBox::placeholder { color: #aaaaaa; }
    .inputBox:focus { outline: none; }

    .inputSpanTag {
    display: block;
    position: absolute;
    bottom: 0;
    left: 0%;  /* right로만 바꿔주면 오 - 왼 */
    background-color: #666;
    width: 0;
    height: 2px;
    border-radius: 2px;
    transition: 0.5s;
    }

    .inputLabelTag {
    position: absolute;
    color: #aaa;
    left: 10px;
    font-size: 20px;
    bottom: 8px;
    transition: all .2s;
    }

    .inputBox:focus ~ label, .inputBox:valid ~ label {
    font-size: 16px;
    bottom: 40px;
    color: #666;
    font-weight: bold;
    }

    .inputBox:focus ~ span, .inputBox:valid ~ span {
    width: 100%;
    }

    /*table 태그*/
    .rwd-table {
    margin: auto;
    min-width: 300px;
    max-width: 100%;
    border-collapse: collapse;
    font-family: 'Pretendard-Regular';
    }

    .rwd-table tr:first-child {
    border-top: none;
    background: #343a40;
    /*#428bca*/
    color: #fff;
    }

    .rwd-table tr {
    border-top: 1px solid #ddd;
    border-bottom: 1px solid #ddd;
    background-color: #E2E2E2;
    /*#f5f9fc*/
    }

    .rwd-table tr:nth-child(odd):not(:first-child) {
    background-color: white;
    }

    .rwd-table th {
    display: none;
    }

    .rwd-table td {
    display: block;
    }

    .rwd-table td:first-child {
    margin-top: .5em;
    }

    .rwd-table td:last-child {
    margin-bottom: .5em;
    }

    .rwd-table td:before {
    content: attr(data-th) ": ";
    font-weight: bold;
    width: 120px;
    display: inline-block;
    color: #000;
    }

    .rwd-table th,
    .rwd-table td {
    text-align: left;
    }

    .rwd-table {
    color: #333;
    border-radius: 0;
    /*.4em*/
    overflow: hidden;
    }

    .rwd-table tr {
    border-color: #bfbfbf;
    }

    .rwd-table th,
    .rwd-table td {
    padding: .5em 1em;
    }

    @media screen and (max-width: 601px) {
    .rwd-table tr:nth-child(2) {
    border-top: none;
    }
    }
    @media screen and (min-width: 600px) {
    .rwd-table tr:hover:not(:first-child) {
    background-color: rgba(0,0,0,0.18);
    /*#d8e7f3*/
    }
    .rwd-table td:before {
    display: none;
    }

    .rwd-table th,
    .rwd-table td {
    display: table-cell;
    padding: .25em .5em;
    }

    .rwd-table th:first-child,
    .rwd-table td:first-child {
    padding-left: 0;
    }

    .rwd-table th:last-child,
    .rwd-table td:last-child {
    padding-right: 0;
    }

    .rwd-table th,
    .rwd-table td {
    padding: 1em !important;
    }
    }

    .containerTable {
    display: block;
    text-align: center;
    }

    @-webkit-keyframes leftRight {
    0%    { -webkit-transform: translateX(0)}
    25%   { -webkit-transform: translateX(-10px)}
    75%   { -webkit-transform: translateX(10px)}
    100%  { -webkit-transform: translateX(0)}
    }
    @keyframes leftRight {
    0%    { transform: translateX(0)}
    25%   { transform: translateX(-10px)}
    75%   { transform: translateX(10px)}
    100%  { transform: translateX(0)}
    }

    /*모달 CSS*/
    /*
    .modal.show {
    display: block;
    }
    */

    /*페이징 CSS*/
    .pagination__wrapper {
    width: 40%;
    height: 50px;
    position: absolute;
    text-align: center;
    }
    .pagination__wrapper:before, .pagination__wrapper:after {
    background: linear-gradient(to right, transparent 0%, rgba(0, 0, 0, 0.1) 17%, rgba(0, 0, 0, 0.1) 83%, transparent 100%);
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#00000000', endColorstr='#00000000',GradientType=1 );
    content: "";
    height: 1px;
    left: 0;
    position: absolute;
    width: 100%;
    }
    .pagination__wrapper:before {
    top: -1px;
    }
    .pagination__wrapper:after {
    bottom: -1px;
    }

    @-webkit-keyframes hoverAnimation {
    from {
    opacity: 1;
    }
    to {
    opacity: 0;
    }
    }

    @keyframes hoverAnimation {
    from {
    opacity: 1;
    }
    to {
    opacity: 0;
    }
    }
    .pagination {
    display: flex;
    justify-content: center;
    margin: 0;
    padding: 0;
    }
    .pagination .pagelist {
    display: block;
    float: left;
    padding: 0.4vw;
    }
    .pagination .pagebtn{
    background: none;
    border: none;
    border-radius: 50%;
    box-sizing: border-box;
    color: rgba(0, 0, 0, 0.6);
    display: block;
    font-size: clamp(0.5rem, 2vw,1rem);
    line-height: clamp(2rem, 4vw,2.5rem);
    min-width: clamp(2rem, 4vw,2.5rem);
    padding: 0;
    outline: none;
    position: relative;
    -webkit-transition: all 170ms linear;
    transition: all 170ms linear;
    }
    .pagination .pagebtn:before {
    background: rgba(0, 0, 0, 0.2);
    border-radius: 50%;
    content: "";
    cursor: pointer;
    height: 0;
    left: 50%;
    opacity: 0;
    position: absolute;
    -webkit-transform: translate(-50%, -50%);
    transform: translate(-50%, -50%);
    -webkit-transition: all 170ms linear;
    transition: all 170ms linear;
    top: 50%;
    width: 0;
    }

    .pagination .pagebtn:hover:not(.active):before {
    -webkit-animation: hoverAnimation 510ms linear forwards;
    animation: hoverAnimation 510ms linear forwards;
    height: 100%;
    width: 100%;
    }
    .pagination .pagebtn.active {
    background: rgba(0, 0, 0, 0.1);
    color: black;
    }

    /*SELECT CSS*/
    .sel {
    display: inline-block;
    width: 300px;
    padding-right: 10px;
    background-color: transparent;
    position: relative;
    cursor: pointer;
    word-break:keep-all;
    z-index:100;
    }

    .sel::before {
    position: absolute;
    content: "\2660";
    font-family: 'FontAwesome';
    font-size: 20px;
    color: #838e95;
    right: 10px;
    top: calc(50% - 0.5em);
    }

    .sel.active::before {
    transform: rotateX(-180deg);
    }

    .sel__placeholder {
    display: block;
    font-family: 'Quicksand';
    font-size: 20px;
    color: #838e95;
    padding: 0.2em 0.5em;
    text-align: left;
    pointer-events: none;
    user-select: none;
    visibility: visible;
    }

    .sel.active .sel__placeholder {
    visibility: hidden;
    }

    .sel__placeholder::before {
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    padding: 0.2em 0.5em;
    content: attr(data-placeholder);
    visibility: hidden;
    }

    .sel.active .sel__placeholder::before {
    visibility: visible;
    }

    .sel__box {
    position: absolute;
    top: calc(100% + 4px);
    left: -4px;
    display: none;
    list-style-type: none;
    text-align: left;
    font-size: 20px;
    background-color: #eeebe7;
    width: calc(100% + 8px);
    box-sizing: border-box;
    }

    .sel.active .sel__box {
    display: block;
    animation: fadeInUp 500ms;
    }

    .sel__box__options {
    display: list-item;
    font-family: 'Quicksand';
    font-size: 15px;
    color: #838e95;
    padding: 0.5em 1em;
    user-select: none;
    word-break:keep-all;
    }

    .sel__box__options::after {
    content: '\2713';
    font-family: 'FontAwesome';
    font-size: 15px;
    margin-left: 5px;
    display: none;
    }

    .sel__box__options.selected::after {
    display: inline;
    }

    .sel__box__options:hover {
    background-color: rgba(0, 0, 0, 0.3);
    color: #212529;
    }

    /* ----- Select Box Black Panther ----- */
    .sel {
    border-bottom: 4px solid rgba(0, 0, 0, 0.3);
    }

    /* ===== Keyframes ===== */
    @keyframes fadeInUp {
    from {
    opacity: 0;
    transform: translate3d(0, 20px, 0);
    }

    to {
    opacity: 1;
    transform: none;
    }
    }

    @keyframes fadeOut {
    from {
    opacity: 1;
    }

    to {
    opacity: 0;
    }
    }
    </style>
</head>
<body>


</body>