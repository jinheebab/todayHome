<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="/js/jquery.bxslider.min.js"></script>
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<br/><br/>

<form action="/board/write" method="post">
	<div class="inlineBlock_36rlri" data-reactid="88"><span data-reactid="89"><div class="container_puzkdo" data-reactid="90"><div class="container_uhlm2-o_O-mediumAndAbove_1udzt2s" data-reactid="91"><div class="container_1jdl6m3" data-reactid="92"><div class="container_mv0xzc" style="width:100%;" data-reactid="93"><!-- react-text: 94 --><!-- /react-text --><button type="button" class="button_1b5aaxl" data-reactid="95"><span class="icon_12hl23n" data-reactid="96"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" aria-hidden="true" focusable="false" style="display:block;fill:currentColor;height:18px;width:18px;" data-reactid="97"><path fill-rule="nonzero" d="M3.83 9.4a7.75 7.75 0 1 0 15.342 2.198A7.75 7.75 0 0 0 3.83 9.401zm16.825 2.412A9.25 9.25 0 1 1 2.343 9.186a9.25 9.25 0 0 1 18.312 2.626zM16.97 18.03a.75.75 0 0 1 1.06-1.06l5 5a.75.75 0 0 1-1.06 1.06" data-reactid="98"></path></svg></span><span class="copy_14aozyc" data-reactid="99">모든 위치 · 모든 날짜 · 인원 1명</span></button><div class="focusUnderline_7131v4" data-reactid="100"></div></div></div><!-- react-empty: 101 --></div><div class="container_1mhi7sr" data-reactid="102"><div class="container_1jdl6m3" data-reactid="103"><div class="container_mv0xzc" style="width:33.3333%;" data-reactid="104"><!-- react-text: 105 --><!-- /react-text --><button type="button" class="button_1b5aaxl-o_O-button_large_c3pob4" data-reactid="106"><span class="icon_12hl23n" data-reactid="107"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" aria-hidden="true" focusable="false" style="display:block;fill:currentColor;height:18px;width:18px;" data-reactid="108"><path fill-rule="nonzero" d="M3.83 9.4a7.75 7.75 0 1 0 15.342 2.198A7.75 7.75 0 0 0 3.83 9.401zm16.825 2.412A9.25 9.25 0 1 1 2.343 9.186a9.25 9.25 0 0 1 18.312 2.626zM16.97 18.03a.75.75 0 0 1 1.06-1.06l5 5a.75.75 0 0 1-1.06 1.06" data-reactid="109"></path></svg></span><span class="copy_14aozyc" data-reactid="110"><span data-reactid="111">모든 위치</span></span></button><div class="focusUnderline_7131v4" data-reactid="112"></div></div><div class="container_mv0xzc-o_O-borders_1i3e8fo" style="width:33.3333%;" data-reactid="113"><!-- react-text: 114 --><!-- /react-text --><button type="button" class="button_1b5aaxl-o_O-button_large_c3pob4" data-reactid="115"><span class="icon_12hl23n" data-reactid="116"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" aria-hidden="true" focusable="false" style="display:block;fill:currentColor;height:18px;width:18px;" data-reactid="117"><path d="M22 9.5V3h-4.75V1a.75.75 0 1 0-1.5 0v2H8.249l.001-2a.75.75 0 1 0-1.5 0l-.001 2H2v19.008a1 1 0 0 0 .992.992h18.016a1 1 0 0 0 .992-.992V9.5zm-18.5-5h3.248V5a.75.75 0 0 0 1.5 0v-.5h7.502V5a.75.75 0 0 0 1.5 0v-.5h3.25V8h-17V4.5zm0 17v-12h17v12h-17z" fill-rule="evenodd" data-reactid="118"></path></svg></span><span class="copy_14aozyc" data-reactid="119">모든 날짜</span></button><div class="focusUnderline_7131v4" data-reactid="120"></div></div><div class="container_mv0xzc" style="width:33.3333%;" data-reactid="121"><!-- react-text: 122 --><!-- /react-text --><div data-reactid="123"><button type="button" class="button_1b5aaxl" data-reactid="124"><span class="icon_12hl23n" data-reactid="125"><span class="icon_18ph2th" data-reactid="126"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" aria-hidden="true" focusable="false" style="display:block;fill:currentColor;height:18px;width:18px;" data-reactid="127"><path d="M3.31 11.565c-.657.503-1.101.992-1.47 1.664-1.141 2.08-1.464 6.818-.199 8.523 1.302 1.755 2.688 2.154 6.542 2.154 2.814 0 4.703-1.003 5.166-3.427.16-.839.139-1.547-.013-2.588l-.055-.367c-.122-.797-.163-1.179-.16-1.662.01-1.547.733-2.278 2.623-3.239.555-.283.903-.854.901-1.476-.001-.468-.2-.842-.538-1.209a3.055 3.055 0 0 1-.48-.69c-.315-.618-.397-1.19-.388-1.977v-.123c0-1.648.812-2.646 2.161-2.646 1.35 0 2.16.998 2.16 2.646 0 1.037-.233 1.974-.987 2.79-.34.368-.538.74-.54 1.209a1.65 1.65 0 0 0 .904 1.476c1.869.952 2.601 1.693 2.634 3.25.009.405.022.767.049 1.366.109 2.45.06 3.222-.338 3.904-.474.809-1.603 1.24-3.89 1.263-1.194.012-1.64-.018-2.362-.184a.75.75 0 1 0-.335 1.462c.86.198 1.41.235 2.713.222 2.758-.028 4.371-.643 5.168-2.006.611-1.043.666-1.932.543-4.727-.027-.589-.04-.941-.048-1.331-.048-2.273-1.14-3.377-3.454-4.556a.15.15 0 0 1-.083-.135c0-.016.032-.077.141-.196.61-.66.996-1.43 1.204-2.265.14-.558.182-1.028.182-1.542 0-2.416-1.407-4.146-3.661-4.146s-3.66 1.73-3.66 4.146l-.001.108c-.01 1.01.1 1.788.55 2.673.188.368.425.712.716 1.027.108.117.14.178.14.196a.15.15 0 0 1-.082.134c-2.343 1.192-3.429 2.289-3.442 4.567-.003.585.044 1.026.177 1.897l.054.357c.13.89.146 1.448.023 2.09-.298 1.564-1.513 2.21-3.692 2.21-3.422 0-4.397-.282-5.337-1.549-.86-1.159-.578-5.29.309-6.907.26-.475.566-.811 1.067-1.195.291-.223 1.9-1.297 2.423-1.673.446-.321.71-.839.709-1.388l-.001-.15a1.755 1.755 0 0 0-.649-1.34C6.01 7.628 5.537 6.17 5.537 4.721c0-1.928 1.107-3.13 2.646-3.13s2.646 1.202 2.646 3.13c0 1.465-.458 2.913-1.144 3.481-.415.344-.65.836-.65 1.404a1.698 1.698 0 0 0 .922 1.519c.408.208.57.29.791.407a.75.75 0 1 0 .7-1.327c-.23-.12-.396-.206-.808-.416a.198.198 0 0 1-.106-.177c0-.123.034-.193.108-.254 1.1-.911 1.687-2.77 1.687-4.637 0-2.73-1.75-4.63-4.146-4.63s-4.146 1.9-4.146 4.63c0 1.85.606 3.724 1.71 4.637.07.059.106.13.106.193v.15a.204.204 0 0 1-.084.163c-.487.35-2.12 1.441-2.459 1.7z" fill-rule="evenodd" data-reactid="128"></path></svg></span></span><span class="copy_14aozyc" data-reactid="129"><span data-reactid="130"><span data-reactid="131">인원 1명</span></span></span></button></div><div class="focusUnderline_7131v4" data-reactid="132"></div></div></div></div><div class="container_e4p5a8" data-reactid="133"><!-- react-empty: 134 --><form action="/s/all" method="get" data-reactid="135"><div class="container_1jdl6m3" data-reactid="136"><div class="container_mv0xzc" style="width:33.3333%;" data-reactid="137"><label class="label_1om3jpt" for="GeocompleteController-via-SearchBarLarge" data-reactid="138">위치</label><div class="largeGeocomplete_1g20x4k" data-reactid="139"><div class="container_gor68n" data-reactid="140"><div data-reactid="141"><div class="container_e296pg" data-reactid="142"><div class="container_36rlri-o_O-block_r99te6" data-reactid="143"><label class="label_hidden_1m8bb6v" for="GeocompleteController-via-SearchBarLarge" data-reactid="144">Location</label><div class="container_ssgg6h-o_O-container_noMargins_18e9acw-o_O-borderless_mflkgb-o_O-block_r99te6" data-reactid="145"><div class="inputContainer_178faes" data-reactid="146"><input type="text" autocomplete="off" class="input_ia1fbh-o_O-input_book_f17nnd-o_O-input_ellipsis_1bgueul-o_O-input_defaultPlaceholder_jsyynz" id="GeocompleteController-via-SearchBarLarge" name="location" placeholder="모든 위치" value="" data-reactid="147"></div></div></div></div></div></div></div><div class="focusUnderline_7131v4" data-reactid="148"></div></div><div class="container_mv0xzc-o_O-borders_1i3e8fo" style="width:33.3333%;" data-reactid="149"><div class="label_1om3jpt" data-reactid="150">날짜</div><div class="webcot-lg-datepicker webcot-lg-datepicker--jumbo" data-reactid="151"><button type="button" class="button_1b5aaxl-o_O-button_large_c3pob4" data-reactid="152"><span class="icon_12hl23n" data-reactid="153"></span><span class="copy_14aozyc-o_O-copy_fakePlaceholder_10k87om" data-reactid="154">모든 날짜</span></button></div><div class="focusUnderline_7131v4" data-reactid="155"></div></div><div class="container_mv0xzc" style="width:33.3333%;" data-reactid="156"><div class="label_1om3jpt" data-reactid="157">인원</div><div data-reactid="158"><button type="button" class="button_1b5aaxl-o_O-button_large_c3pob4" data-reactid="159"><span class="icon_12hl23n" data-reactid="160"></span><span class="copy_14aozyc-o_O-copy_fakePlaceholder_10k87om" data-reactid="161"><span data-reactid="162"><span data-reactid="163">인원 1명</span></span></span><span class="chevron_ki52l6" data-reactid="164"><div class="iconWrapper_d5depq" style="transform:rotate(0deg);" data-reactid="165"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 18 18" aria-hidden="true" focusable="false" style="display:block;fill:currentColor;height:12px;width:12px;" data-reactid="166"><path fill-rule="evenodd" d="M16.291 4.295a1 1 0 1 1 1.414 1.415l-8 7.995a1 1 0 0 1-1.414 0l-8-7.995a1 1 0 1 1 1.414-1.415l7.293 7.29 7.293-7.29z" data-reactid="167"></path></svg></div></span></button></div><div class="focusUnderline_7131v4" data-reactid="168"></div></div><div class="container_mv0xzc" style="width:0%;" data-reactid="169"><!-- react-text: 170 --><!-- /react-text --><button type="submit" class="searchButton_n8fchz" data-reactid="171"><span data-reactid="172">숙소 검색</span></button><div class="focusUnderline_7131v4" data-reactid="173"></div></div></div></form></div><!-- react-empty: 174 --><!-- react-empty: 175 --><!-- react-empty: 176 --></div><!-- react-empty: 177 --></span></div>
		<span data-reactid="89"><div class="container_puzkdo" data-reactid="90"><div class="container_uhlm2-o_O-mediumAndAbove_1udzt2s" data-reactid="91"><div class="container_1jdl6m3" data-reactid="92"><div class="container_mv0xzc" style="width:100%;" data-reactid="93"><!-- react-text: 94 --><!-- /react-text --><button type="button" class="button_1b5aaxl" data-reactid="95"><span class="icon_12hl23n" data-reactid="96"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" aria-hidden="true" focusable="false" style="display:block;fill:currentColor;height:18px;width:18px;" data-reactid="97"><path fill-rule="nonzero" d="M3.83 9.4a7.75 7.75 0 1 0 15.342 2.198A7.75 7.75 0 0 0 3.83 9.401zm16.825 2.412A9.25 9.25 0 1 1 2.343 9.186a9.25 9.25 0 0 1 18.312 2.626zM16.97 18.03a.75.75 0 0 1 1.06-1.06l5 5a.75.75 0 0 1-1.06 1.06" data-reactid="98"></path></svg></span><span class="copy_14aozyc" data-reactid="99">모든 위치 · 모든 날짜 · 인원 1명</span></button><div class="focusUnderline_7131v4" data-reactid="100"></div></div></div><!-- react-empty: 101 --></div><div class="container_1mhi7sr" data-reactid="102"><div class="container_1jdl6m3" data-reactid="103"><div class="container_mv0xzc" style="width:33.3333%;" data-reactid="104"><!-- react-text: 105 --><!-- /react-text --><button type="button" class="button_1b5aaxl-o_O-button_large_c3pob4" data-reactid="106"><span class="icon_12hl23n" data-reactid="107"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" aria-hidden="true" focusable="false" style="display:block;fill:currentColor;height:18px;width:18px;" data-reactid="108"><path fill-rule="nonzero" d="M3.83 9.4a7.75 7.75 0 1 0 15.342 2.198A7.75 7.75 0 0 0 3.83 9.401zm16.825 2.412A9.25 9.25 0 1 1 2.343 9.186a9.25 9.25 0 0 1 18.312 2.626zM16.97 18.03a.75.75 0 0 1 1.06-1.06l5 5a.75.75 0 0 1-1.06 1.06" data-reactid="109"></path></svg></span><span class="copy_14aozyc" data-reactid="110"><span data-reactid="111">모든 위치</span></span></button><div class="focusUnderline_7131v4" data-reactid="112"></div></div><div class="container_mv0xzc-o_O-borders_1i3e8fo" style="width:33.3333%;" data-reactid="113"><!-- react-text: 114 --><!-- /react-text --><button type="button" class="button_1b5aaxl-o_O-button_large_c3pob4" data-reactid="115"><span class="icon_12hl23n" data-reactid="116"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" aria-hidden="true" focusable="false" style="display:block;fill:currentColor;height:18px;width:18px;" data-reactid="117"><path d="M22 9.5V3h-4.75V1a.75.75 0 1 0-1.5 0v2H8.249l.001-2a.75.75 0 1 0-1.5 0l-.001 2H2v19.008a1 1 0 0 0 .992.992h18.016a1 1 0 0 0 .992-.992V9.5zm-18.5-5h3.248V5a.75.75 0 0 0 1.5 0v-.5h7.502V5a.75.75 0 0 0 1.5 0v-.5h3.25V8h-17V4.5zm0 17v-12h17v12h-17z" fill-rule="evenodd" data-reactid="118"></path></svg></span><span class="copy_14aozyc" data-reactid="119">모든 날짜</span></button><div class="focusUnderline_7131v4" data-reactid="120"></div></div><div class="container_mv0xzc" style="width:33.3333%;" data-reactid="121"><!-- react-text: 122 --><!-- /react-text --><div data-reactid="123"><button type="button" class="button_1b5aaxl" data-reactid="124"><span class="icon_12hl23n" data-reactid="125"><span class="icon_18ph2th" data-reactid="126"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" aria-hidden="true" focusable="false" style="display:block;fill:currentColor;height:18px;width:18px;" data-reactid="127"><path d="M3.31 11.565c-.657.503-1.101.992-1.47 1.664-1.141 2.08-1.464 6.818-.199 8.523 1.302 1.755 2.688 2.154 6.542 2.154 2.814 0 4.703-1.003 5.166-3.427.16-.839.139-1.547-.013-2.588l-.055-.367c-.122-.797-.163-1.179-.16-1.662.01-1.547.733-2.278 2.623-3.239.555-.283.903-.854.901-1.476-.001-.468-.2-.842-.538-1.209a3.055 3.055 0 0 1-.48-.69c-.315-.618-.397-1.19-.388-1.977v-.123c0-1.648.812-2.646 2.161-2.646 1.35 0 2.16.998 2.16 2.646 0 1.037-.233 1.974-.987 2.79-.34.368-.538.74-.54 1.209a1.65 1.65 0 0 0 .904 1.476c1.869.952 2.601 1.693 2.634 3.25.009.405.022.767.049 1.366.109 2.45.06 3.222-.338 3.904-.474.809-1.603 1.24-3.89 1.263-1.194.012-1.64-.018-2.362-.184a.75.75 0 1 0-.335 1.462c.86.198 1.41.235 2.713.222 2.758-.028 4.371-.643 5.168-2.006.611-1.043.666-1.932.543-4.727-.027-.589-.04-.941-.048-1.331-.048-2.273-1.14-3.377-3.454-4.556a.15.15 0 0 1-.083-.135c0-.016.032-.077.141-.196.61-.66.996-1.43 1.204-2.265.14-.558.182-1.028.182-1.542 0-2.416-1.407-4.146-3.661-4.146s-3.66 1.73-3.66 4.146l-.001.108c-.01 1.01.1 1.788.55 2.673.188.368.425.712.716 1.027.108.117.14.178.14.196a.15.15 0 0 1-.082.134c-2.343 1.192-3.429 2.289-3.442 4.567-.003.585.044 1.026.177 1.897l.054.357c.13.89.146 1.448.023 2.09-.298 1.564-1.513 2.21-3.692 2.21-3.422 0-4.397-.282-5.337-1.549-.86-1.159-.578-5.29.309-6.907.26-.475.566-.811 1.067-1.195.291-.223 1.9-1.297 2.423-1.673.446-.321.71-.839.709-1.388l-.001-.15a1.755 1.755 0 0 0-.649-1.34C6.01 7.628 5.537 6.17 5.537 4.721c0-1.928 1.107-3.13 2.646-3.13s2.646 1.202 2.646 3.13c0 1.465-.458 2.913-1.144 3.481-.415.344-.65.836-.65 1.404a1.698 1.698 0 0 0 .922 1.519c.408.208.57.29.791.407a.75.75 0 1 0 .7-1.327c-.23-.12-.396-.206-.808-.416a.198.198 0 0 1-.106-.177c0-.123.034-.193.108-.254 1.1-.911 1.687-2.77 1.687-4.637 0-2.73-1.75-4.63-4.146-4.63s-4.146 1.9-4.146 4.63c0 1.85.606 3.724 1.71 4.637.07.059.106.13.106.193v.15a.204.204 0 0 1-.084.163c-.487.35-2.12 1.441-2.459 1.7z" fill-rule="evenodd" data-reactid="128"></path></svg></span></span><span class="copy_14aozyc" data-reactid="129"><span data-reactid="130"><span data-reactid="131">인원 1명</span></span></span></button></div><div class="focusUnderline_7131v4" data-reactid="132"></div></div></div></div><div class="container_e4p5a8" data-reactid="133"><!-- react-empty: 134 --><form action="/s/all" method="get" data-reactid="135"><div class="container_1jdl6m3" data-reactid="136"><div class="container_mv0xzc" style="width:33.3333%;" data-reactid="137"><label class="label_1om3jpt" for="GeocompleteController-via-SearchBarLarge" data-reactid="138">위치</label><div class="largeGeocomplete_1g20x4k" data-reactid="139"><div class="container_gor68n" data-reactid="140"><div data-reactid="141"><div class="container_e296pg" data-reactid="142"><div class="container_36rlri-o_O-block_r99te6" data-reactid="143"><label class="label_hidden_1m8bb6v" for="GeocompleteController-via-SearchBarLarge" data-reactid="144">Location</label><div class="container_ssgg6h-o_O-container_noMargins_18e9acw-o_O-borderless_mflkgb-o_O-block_r99te6" data-reactid="145"><div class="inputContainer_178faes" data-reactid="146"><input type="text" autocomplete="off" class="input_ia1fbh-o_O-input_book_f17nnd-o_O-input_ellipsis_1bgueul-o_O-input_defaultPlaceholder_jsyynz" id="GeocompleteController-via-SearchBarLarge" name="location" placeholder="모든 위치" value="" data-reactid="147"></div></div></div></div></div></div></div><div class="focusUnderline_7131v4" data-reactid="148"></div></div><div class="container_mv0xzc-o_O-borders_1i3e8fo" style="width:33.3333%;" data-reactid="149"><div class="label_1om3jpt" data-reactid="150">날짜</div><div class="webcot-lg-datepicker webcot-lg-datepicker--jumbo" data-reactid="151"><button type="button" class="button_1b5aaxl-o_O-button_large_c3pob4" data-reactid="152"><span class="icon_12hl23n" data-reactid="153"></span><span class="copy_14aozyc-o_O-copy_fakePlaceholder_10k87om" data-reactid="154">모든 날짜</span></button></div><div class="focusUnderline_7131v4" data-reactid="155"></div></div><div class="container_mv0xzc" style="width:33.3333%;" data-reactid="156"><div class="label_1om3jpt" data-reactid="157">인원</div><div data-reactid="158"><button type="button" class="button_1b5aaxl-o_O-button_large_c3pob4" data-reactid="159"><span class="icon_12hl23n" data-reactid="160"></span><span class="copy_14aozyc-o_O-copy_fakePlaceholder_10k87om" data-reactid="161"><span data-reactid="162"><span data-reactid="163">인원 1명</span></span></span><span class="chevron_ki52l6" data-reactid="164"><div class="iconWrapper_d5depq" style="transform:rotate(0deg);" data-reactid="165"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 18 18" aria-hidden="true" focusable="false" style="display:block;fill:currentColor;height:12px;width:12px;" data-reactid="166"><path fill-rule="evenodd" d="M16.291 4.295a1 1 0 1 1 1.414 1.415l-8 7.995a1 1 0 0 1-1.414 0l-8-7.995a1 1 0 1 1 1.414-1.415l7.293 7.29 7.293-7.29z" data-reactid="167"></path></svg></div></span></button></div><div class="focusUnderline_7131v4" data-reactid="168"></div></div><div class="container_mv0xzc" style="width:0%;" data-reactid="169"><!-- react-text: 170 --><!-- /react-text --><button type="submit" class="searchButton_n8fchz" data-reactid="171"><span data-reactid="172">숙소 검색</span></button><div class="focusUnderline_7131v4" data-reactid="173"></div></div></div></form></div><!-- react-empty: 174 --><!-- react-empty: 175 --><!-- react-empty: 176 --></div><!-- react-empty: 177 --></span>
</form>
<!-- <table width="100%" style="border-style: solid; border-width: 2px;"> -->
<!-- 		<tr style="text-align:left; height: 30px; " > -->
<!-- 			<td> -->
<!-- 				<label for="location">위치</label> -->
<!-- 				<input type="text" class="form-control" name="search" size="30px" placeholder="목적지, 도시명, 주소" /> -->
<!-- 			</td> -->
<!-- 			<td> -->
<!-- 				<label for="checkin">체크인</label> -->
<!-- 				<input type="date" class="form-control" name="sdate" size="30px" placeholder="체크인" /> -->
<!-- 			</td> -->
<!-- 			<td> -->
<!-- 				<label for="checkout">체크아웃</label> -->
<!-- 				<input type="date" class="form-control" name="edate" size="30px" placeholder="체크아웃" /> -->
<!-- 			</td> -->
<!-- 			<td> -->
<!-- 				<label for="cnt">인원</label> -->
				
<!-- 			</td> -->
<!-- 			<td> -->
<!-- 				<button type="submit" class="btn" style="background-color: orange; border-radius: 0" ><font color="white"><b>검색</b></font></button> -->
<!-- 			</td> -->
<!-- 		</tr>  -->
<!-- </table> -->
   
   
<div class="row" style="margin-bottom: 30px;">
  <div class="col-md-1" align="right">
    <br/><br/><br/><br/><br/><br/><br/><br/>
 <span id="slider-prev" style="font-size: 2em; padding-left: 20%"></span>
 </div>
<div class="col-md-10">
<span style=" font-weight:bold; font-size:1.5em; ">HOT LOCATION</span>
<hr style="border-bottom-style: solid; border-bottom-width: 1.5px; border-bottom-color: black; margin-top: 10px;"/>
<div align="center">
<ul class="bxslider" >
<c:forEach var="i" items="${list}" end="4" >
  <li><div style="width: 480.5px; height: 320.33px; overflow: hidden;">
  <a href="/view/detail?num=${i.NUM}">
  <img src="${i.PICURL}" width=600px height=350px title="${i.TITLE} .${i.COUNTRY}  [${i.HTYPE}] "/>
  </a></div></li>
  </c:forEach>
</ul>
</div>
</div>
<div class="col-md-1" align="left">
<br/><br/><br/><br/><br/><br/><br/><br/>
<span id="slider-next" style="font-size: 2em; padding-right: 20%"></span>
</div>
</div>


<!-- ================================================================= -->
  <div class="row">
  <div class="col-md-1" align="right">
    <br/><br/><br/><br/><br/>
 <span id="slider-prev1" style="font-size: 2em; padding-left: 20%"></span>
 </div>
<div class="col-md-10">
<span style=" font-weight:bold; font-size:1.5em; ">TODAY's CHOICE</span>
<hr style="border-bottom-style: solid; border-bottom-width: 1.5px; border-bottom-color: black; margin-top: 10px;"/>
<div align="center">
<ul class="bxslider1" >
<c:forEach var="i" items="${list}" end="4" >
  <li><div style="width: 330.5px; height: 170.33px; overflow: hidden;">
  <a href="/view/detail?num=${i.NUM}">
  <img src="${i.PICURL}" width=270px height=170px title="${i.TITLE} .${i.COUNTRY}  [${i.HTYPE}] "/>
  </a></div></li>
  </c:forEach>
</ul>
</div>
</div>
<div class="col-md-1" align="left">
<br/><br/><br/><br/><br/>
<span id="slider-next1" style="font-size: 2em; padding-right: 20%"></span>
</div>
</div>

<div id="bx-pager">
  <a data-slide-index="0" ></a>
  <a data-slide-index="1" ></a>
  <a data-slide-index="2" ></a>
</div>

<div class="row" align="center" style="padding-bottom: 2%;" >	
  <br/><br/>
  <b>오늘만큼은 여기가 우리 집이에요. 전 세계에 있는 우리 집을 경험해보세요.</b>
 </div>
  
  
<script>
$(function(){ 
	  $('.bt_up3').click(function(){ 
	    var n = $('#bedcnt').val();
	    
	    var num = Number(n)+Number('1');
	    
	    $('#bedcnt').val(num);
	    
	  });
	  
	  
	  $('.bt_down3').click(function(){ 
		    var n = $('#bedcnt').val();
		    
		    var num = Number(n)-Number('1');
		    
		    $('#bedcnt').val(num);
		    
		  });
	
	
})

  $('.bxslider').bxSlider({
	  nextSelector: '#slider-next',
	  prevSelector: '#slider-prev',
	  nextText: '>',
	  prevText: '<',
	  
	
	  minSlides: 2,
	  maxSlides: 2,
	  slideWidth: 480,
	  slideMargin: 10,
	  mode: 'horizontal' ,
	  captions: true,
	  pagerCustom: '#bx-pager'
	});
  
  $('.bxslider1').bxSlider({
	  
	  nextSelector: '#slider-next1',
	  prevSelector: '#slider-prev1',
	  nextText: '>',
	  prevText: '<',
	
	  minSlides: 3,
	  maxSlides: 3,
	  slideWidth: 350,
	  slideMargin: 10,
	  mode: 'horizontal' ,
	  captions: true,
	  pagerCustom: '#bx-pager'
	});
</script>