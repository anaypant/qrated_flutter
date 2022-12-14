import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await launchURL('https://qrated.weblium.site/');
                      },
                      text: 'Qrated',
                      options: FFButtonOptions(
                        width: 130,
                        height: 40,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        textStyle: FlutterFlowTheme.of(context)
                            .subtitle2
                            .override(
                              fontFamily: 'Roboto Mono',
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                        borderSide: BorderSide(
                          color: Color(0xFF473BFF),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  AuthUserStreamWidget(
                    child: SelectionArea(
                        child: AutoSizeText(
                      'Hey,${currentUserDisplayName}',
                      style: FlutterFlowTheme.of(context).bodyText1,
                    )),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 10,
                      borderWidth: 0,
                      buttonSize: 50,
                      icon: Icon(
                        Icons.settings,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30,
                      ),
                      onPressed: () async {
                        context.pushNamed('SettingsPage');
                      },
                    ),
                  ),
                ],
              ),
              Expanded(
                child: DefaultTabController(
                  length: 4,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      TabBar(
                        isScrollable: true,
                        labelColor: FlutterFlowTheme.of(context).primaryText,
                        unselectedLabelColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        labelStyle: FlutterFlowTheme.of(context).bodyText1,
                        indicatorColor:
                            FlutterFlowTheme.of(context).primaryText,
                        tabs: [
                          Tab(
                            text: 'Trending',
                          ),
                          StreamBuilder<List<EconomyNewsRecord>>(
                            stream: queryEconomyNewsRecord(
                              singleRecord: true,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                                  ),
                                );
                              }
                              List<EconomyNewsRecord>
                                  economyTabEconomyNewsRecordList =
                                  snapshot.data!;
                              // Return an empty Container when the document does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final economyTabEconomyNewsRecord =
                                  economyTabEconomyNewsRecordList.isNotEmpty
                                      ? economyTabEconomyNewsRecordList.first
                                      : null;
                              return Tab(
                                text: 'Economy',
                              );
                            },
                          ),
                          Tab(
                            text: 'Environment',
                          ),
                          Tab(
                            text: 'Society',
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child:
                                      StreamBuilder<List<TrendingNewsRecord>>(
                                    stream: queryTrendingNewsRecord(
                                      queryBuilder: (trendingNewsRecord) =>
                                          trendingNewsRecord
                                              .orderBy('upVoteCt',
                                                  descending: true)
                                              .orderBy('downVoteCt',
                                                  descending: true)
                                              .orderBy('publishedAt',
                                                  descending: true),
                                      limit: 32,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: CircularProgressIndicator(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                            ),
                                          ),
                                        );
                                      }
                                      List<TrendingNewsRecord>
                                          listViewTrendingNewsRecordList =
                                          snapshot.data!;
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listViewTrendingNewsRecordList
                                                .length,
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewTrendingNewsRecord =
                                              listViewTrendingNewsRecordList[
                                                  listViewIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 4, 0, 4),
                                            child: InkWell(
                                              onTap: () async {
                                                await launchURL(
                                                    listViewTrendingNewsRecord
                                                        .url!);
                                              },
                                              child: Card(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiaryColor,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5, 0, 5, 0),
                                                      child: Text(
                                                        listViewTrendingNewsRecord
                                                            .title!,
                                                        textAlign:
                                                            TextAlign.start,
                                                        maxLines: 3,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto Mono',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      10, 0, 0),
                                                          child: Image.network(
                                                            listViewTrendingNewsRecord
                                                                .urlToImage!,
                                                            width: 250,
                                                            height: 200,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(15,
                                                                      0, 0, 0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            10,
                                                                            0,
                                                                            2),
                                                                child:
                                                                    FlutterFlowIconButton(
                                                                  borderColor:
                                                                      Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      0,
                                                                  borderWidth:
                                                                      1,
                                                                  buttonSize:
                                                                      40,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .arrow_upward,
                                                                    color: Color(
                                                                        0xFF4EA14B),
                                                                    size: 20,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    if (listViewTrendingNewsRecord
                                                                            .votes!
                                                                            .toList()
                                                                            .where((e) =>
                                                                                e.displayName! ==
                                                                                currentUserDisplayName)
                                                                            .toList()
                                                                            .length ==
                                                                        0) {
                                                                      final trendingNewsUpdateData =
                                                                          {
                                                                        'votes':
                                                                            FieldValue.arrayUnion([
                                                                          getModelVotesFirestoreData(
                                                                            createModelVotesStruct(
                                                                              displayName: currentUserDisplayName,
                                                                              vote: 1,
                                                                              clearUnsetFields: false,
                                                                            ),
                                                                            true,
                                                                          )
                                                                        ]),
                                                                        'upVoteCt':
                                                                            FieldValue.increment(1),
                                                                      };
                                                                      await listViewTrendingNewsRecord
                                                                          .reference
                                                                          .update(
                                                                              trendingNewsUpdateData);
                                                                    }
                                                                  },
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            2,
                                                                            0,
                                                                            2),
                                                                child:
                                                                    FlutterFlowIconButton(
                                                                  borderColor:
                                                                      Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      0,
                                                                  borderWidth:
                                                                      1,
                                                                  buttonSize:
                                                                      40,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .arrow_downward,
                                                                    color: Color(
                                                                        0xFFFF5E5E),
                                                                    size: 20,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    if (listViewTrendingNewsRecord
                                                                            .votes!
                                                                            .toList()
                                                                            .where((e) =>
                                                                                e.displayName! ==
                                                                                currentUserDisplayName)
                                                                            .toList()
                                                                            .length ==
                                                                        0) {
                                                                      final trendingNewsUpdateData =
                                                                          {
                                                                        'votes':
                                                                            FieldValue.arrayUnion([
                                                                          getModelVotesFirestoreData(
                                                                            createModelVotesStruct(
                                                                              displayName: currentUserDisplayName,
                                                                              vote: -1,
                                                                              clearUnsetFields: false,
                                                                            ),
                                                                            true,
                                                                          )
                                                                        ]),
                                                                        'downVoteCt':
                                                                            FieldValue.increment(1),
                                                                      };
                                                                      await listViewTrendingNewsRecord
                                                                          .reference
                                                                          .update(
                                                                              trendingNewsUpdateData);
                                                                    }
                                                                  },
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            2,
                                                                            0,
                                                                            0),
                                                                child:
                                                                    FlutterFlowIconButton(
                                                                  borderRadius:
                                                                      0,
                                                                  borderWidth:
                                                                      1,
                                                                  buttonSize:
                                                                      40,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .chat_bubble,
                                                                    color: Color(
                                                                        0xFF473BFF),
                                                                    size: 20,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    context
                                                                        .pushNamed(
                                                                      'TrendingComments',
                                                                      queryParams:
                                                                          {
                                                                        'ref':
                                                                            serializeParam(
                                                                          listViewTrendingNewsRecord,
                                                                          ParamType
                                                                              .Document,
                                                                        ),
                                                                      }.withoutNulls,
                                                                      extra: <
                                                                          String,
                                                                          dynamic>{
                                                                        'ref':
                                                                            listViewTrendingNewsRecord,
                                                                      },
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 1,
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                listViewTrendingNewsRecord
                                                                    .votes!
                                                                    .toList()
                                                                    .where((e) =>
                                                                        e.vote! ==
                                                                        1)
                                                                    .toList()
                                                                    .length
                                                                    .toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Roboto Mono',
                                                                      color: Color(
                                                                          0xFF4EA14B),
                                                                      fontSize:
                                                                          18,
                                                                    ),
                                                              ),
                                                              Text(
                                                                listViewTrendingNewsRecord
                                                                    .votes!
                                                                    .toList()
                                                                    .where((e) =>
                                                                        e.vote! ==
                                                                        -1)
                                                                    .toList()
                                                                    .length
                                                                    .toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Roboto Mono',
                                                                      color: Color(
                                                                          0xFFFF5E5E),
                                                                      fontSize:
                                                                          18,
                                                                    ),
                                                              ),
                                                              Text(
                                                                listViewTrendingNewsRecord
                                                                    .comments!
                                                                    .toList()
                                                                    .length
                                                                    .toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Roboto Mono',
                                                                      color: Color(
                                                                          0xFF473BFF),
                                                                      fontSize:
                                                                          18,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5, 5, 5, 5),
                                                      child: Text(
                                                        listViewTrendingNewsRecord
                                                            .description!,
                                                        textAlign:
                                                            TextAlign.start,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto Mono',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize: 11,
                                                                ),
                                                      ),
                                                    ),
                                                    Text(
                                                      listViewTrendingNewsRecord
                                                          .author!
                                                          .maybeHandleOverflow(
                                                        maxChars: 150,
                                                        replacement: '???',
                                                      ),
                                                      maxLines: 6,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto Mono',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 9,
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            StreamBuilder<List<EconomyNewsRecord>>(
                              stream: queryEconomyNewsRecord(
                                queryBuilder: (economyNewsRecord) =>
                                    economyNewsRecord
                                        .orderBy('upVoteCt', descending: true)
                                        .orderBy('downVoteCt', descending: true)
                                        .orderBy('publishedAt',
                                            descending: true),
                                limit: 32,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                    ),
                                  );
                                }
                                List<EconomyNewsRecord>
                                    listViewEconomyNewsRecordList =
                                    snapshot.data!;
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      listViewEconomyNewsRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewEconomyNewsRecord =
                                        listViewEconomyNewsRecordList[
                                            listViewIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 4, 0, 4),
                                      child: InkWell(
                                        onTap: () async {
                                          await launchURL(
                                              listViewEconomyNewsRecord.url!);
                                        },
                                        child: Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          color: FlutterFlowTheme.of(context)
                                              .tertiaryColor,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(5, 0, 5, 0),
                                                child: Text(
                                                  listViewEconomyNewsRecord
                                                      .title!,
                                                  textAlign: TextAlign.start,
                                                  maxLines: 3,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Roboto Mono',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 10, 0, 0),
                                                    child: Image.network(
                                                      listViewEconomyNewsRecord
                                                          .urlToImage!,
                                                      width: 250,
                                                      height: 200,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                15, 0, 0, 0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      10, 0, 2),
                                                          child:
                                                              FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 0,
                                                            borderWidth: 1,
                                                            buttonSize: 40,
                                                            icon: Icon(
                                                              Icons
                                                                  .arrow_upward,
                                                              color: Color(
                                                                  0xFF4EA14B),
                                                              size: 20,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              if (listViewEconomyNewsRecord
                                                                      .votes!
                                                                      .toList()
                                                                      .where((e) =>
                                                                          e.displayName! ==
                                                                          currentUserDisplayName)
                                                                      .toList()
                                                                      .length ==
                                                                  0) {
                                                                final economyNewsUpdateData =
                                                                    {
                                                                  'votes':
                                                                      FieldValue
                                                                          .arrayUnion([
                                                                    getModelVotesFirestoreData(
                                                                      createModelVotesStruct(
                                                                        displayName:
                                                                            currentUserDisplayName,
                                                                        vote: 1,
                                                                        clearUnsetFields:
                                                                            false,
                                                                      ),
                                                                      true,
                                                                    )
                                                                  ]),
                                                                  'upVoteCt':
                                                                      FieldValue
                                                                          .increment(
                                                                              1),
                                                                };
                                                                await listViewEconomyNewsRecord
                                                                    .reference
                                                                    .update(
                                                                        economyNewsUpdateData);
                                                              }
                                                            },
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      2, 0, 2),
                                                          child:
                                                              FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 0,
                                                            borderWidth: 1,
                                                            buttonSize: 40,
                                                            icon: Icon(
                                                              Icons
                                                                  .arrow_downward,
                                                              color: Color(
                                                                  0xFFFF5E5E),
                                                              size: 20,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              if (listViewEconomyNewsRecord
                                                                      .votes!
                                                                      .toList()
                                                                      .where((e) =>
                                                                          e.displayName! ==
                                                                          currentUserDisplayName)
                                                                      .toList()
                                                                      .length ==
                                                                  0) {
                                                                final economyNewsUpdateData =
                                                                    {
                                                                  'votes':
                                                                      FieldValue
                                                                          .arrayUnion([
                                                                    getModelVotesFirestoreData(
                                                                      createModelVotesStruct(
                                                                        displayName:
                                                                            currentUserDisplayName,
                                                                        vote:
                                                                            -1,
                                                                        clearUnsetFields:
                                                                            false,
                                                                      ),
                                                                      true,
                                                                    )
                                                                  ]),
                                                                  'downVoteCt':
                                                                      FieldValue
                                                                          .increment(
                                                                              1),
                                                                };
                                                                await listViewEconomyNewsRecord
                                                                    .reference
                                                                    .update(
                                                                        economyNewsUpdateData);
                                                              }
                                                            },
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      2, 0, 0),
                                                          child:
                                                              FlutterFlowIconButton(
                                                            borderRadius: 0,
                                                            borderWidth: 1,
                                                            buttonSize: 40,
                                                            icon: Icon(
                                                              Icons.chat_bubble,
                                                              color: Color(
                                                                  0xFF473BFF),
                                                              size: 20,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              context.pushNamed(
                                                                'EconomyComments',
                                                                queryParams: {
                                                                  'ref':
                                                                      serializeParam(
                                                                    listViewEconomyNewsRecord,
                                                                    ParamType
                                                                        .Document,
                                                                  ),
                                                                }.withoutNulls,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  'ref':
                                                                      listViewEconomyNewsRecord,
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          listViewEconomyNewsRecord
                                                              .votes!
                                                              .toList()
                                                              .where((e) =>
                                                                  e.vote! == 1)
                                                              .toList()
                                                              .length
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto Mono',
                                                                color: Color(
                                                                    0xFF4EA14B),
                                                                fontSize: 18,
                                                              ),
                                                        ),
                                                        Text(
                                                          listViewEconomyNewsRecord
                                                              .votes!
                                                              .toList()
                                                              .where((e) =>
                                                                  e.vote! == -1)
                                                              .toList()
                                                              .length
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto Mono',
                                                                color: Color(
                                                                    0xFFFF5E5E),
                                                                fontSize: 18,
                                                              ),
                                                        ),
                                                        Text(
                                                          listViewEconomyNewsRecord
                                                              .comments!
                                                              .toList()
                                                              .length
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto Mono',
                                                                color: Color(
                                                                    0xFF473BFF),
                                                                fontSize: 18,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(5, 5, 5, 5),
                                                child: Text(
                                                  listViewEconomyNewsRecord
                                                      .description!,
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Roboto Mono',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 11,
                                                      ),
                                                ),
                                              ),
                                              Text(
                                                listViewEconomyNewsRecord
                                                    .author!
                                                    .maybeHandleOverflow(
                                                  maxChars: 150,
                                                  replacement: '???',
                                                ),
                                                maxLines: 6,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Roboto Mono',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 9,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                            StreamBuilder<List<EnvironmentNewsRecord>>(
                              stream: queryEnvironmentNewsRecord(
                                queryBuilder: (environmentNewsRecord) =>
                                    environmentNewsRecord
                                        .orderBy('upVoteCt', descending: true)
                                        .orderBy('downVoteCt', descending: true)
                                        .orderBy('publishedAt',
                                            descending: true),
                                limit: 32,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                    ),
                                  );
                                }
                                List<EnvironmentNewsRecord>
                                    listViewEnvironmentNewsRecordList =
                                    snapshot.data!;
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      listViewEnvironmentNewsRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewEnvironmentNewsRecord =
                                        listViewEnvironmentNewsRecordList[
                                            listViewIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 4, 0, 4),
                                      child: InkWell(
                                        onTap: () async {
                                          await launchURL(
                                              listViewEnvironmentNewsRecord
                                                  .url!);
                                        },
                                        child: Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          color: FlutterFlowTheme.of(context)
                                              .tertiaryColor,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(5, 0, 5, 0),
                                                child: Text(
                                                  listViewEnvironmentNewsRecord
                                                      .title!,
                                                  textAlign: TextAlign.start,
                                                  maxLines: 3,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Roboto Mono',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 10, 0, 0),
                                                    child: Image.network(
                                                      listViewEnvironmentNewsRecord
                                                          .urlToImage!,
                                                      width: 250,
                                                      height: 200,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                15, 0, 0, 0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      10, 0, 2),
                                                          child:
                                                              FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 0,
                                                            borderWidth: 1,
                                                            buttonSize: 40,
                                                            icon: Icon(
                                                              Icons
                                                                  .arrow_upward,
                                                              color: Color(
                                                                  0xFF4EA14B),
                                                              size: 20,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              if (listViewEnvironmentNewsRecord
                                                                      .votes!
                                                                      .toList()
                                                                      .where((e) =>
                                                                          e.displayName! ==
                                                                          currentUserDisplayName)
                                                                      .toList()
                                                                      .length ==
                                                                  0) {
                                                                final environmentNewsUpdateData =
                                                                    {
                                                                  'votes':
                                                                      FieldValue
                                                                          .arrayUnion([
                                                                    getModelVotesFirestoreData(
                                                                      createModelVotesStruct(
                                                                        displayName:
                                                                            currentUserDisplayName,
                                                                        vote: 1,
                                                                        clearUnsetFields:
                                                                            false,
                                                                      ),
                                                                      true,
                                                                    )
                                                                  ]),
                                                                  'upVoteCt':
                                                                      FieldValue
                                                                          .increment(
                                                                              1),
                                                                };
                                                                await listViewEnvironmentNewsRecord
                                                                    .reference
                                                                    .update(
                                                                        environmentNewsUpdateData);
                                                              }
                                                            },
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      2, 0, 2),
                                                          child:
                                                              FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 0,
                                                            borderWidth: 1,
                                                            buttonSize: 40,
                                                            icon: Icon(
                                                              Icons
                                                                  .arrow_downward,
                                                              color: Color(
                                                                  0xFFFF5E5E),
                                                              size: 20,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              if (listViewEnvironmentNewsRecord
                                                                      .votes!
                                                                      .toList()
                                                                      .where((e) =>
                                                                          e.displayName! ==
                                                                          currentUserDisplayName)
                                                                      .toList()
                                                                      .length ==
                                                                  0) {
                                                                final environmentNewsUpdateData =
                                                                    {
                                                                  'votes':
                                                                      FieldValue
                                                                          .arrayUnion([
                                                                    getModelVotesFirestoreData(
                                                                      createModelVotesStruct(
                                                                        displayName:
                                                                            currentUserDisplayName,
                                                                        vote:
                                                                            -1,
                                                                        clearUnsetFields:
                                                                            false,
                                                                      ),
                                                                      true,
                                                                    )
                                                                  ]),
                                                                  'downVoteCt':
                                                                      FieldValue
                                                                          .increment(
                                                                              1),
                                                                };
                                                                await listViewEnvironmentNewsRecord
                                                                    .reference
                                                                    .update(
                                                                        environmentNewsUpdateData);
                                                              }
                                                            },
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      2, 0, 0),
                                                          child:
                                                              FlutterFlowIconButton(
                                                            borderRadius: 0,
                                                            borderWidth: 1,
                                                            buttonSize: 40,
                                                            icon: Icon(
                                                              Icons.chat_bubble,
                                                              color: Color(
                                                                  0xFF473BFF),
                                                              size: 20,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              context.pushNamed(
                                                                'EnvironmentComments',
                                                                queryParams: {
                                                                  'ref':
                                                                      serializeParam(
                                                                    listViewEnvironmentNewsRecord,
                                                                    ParamType
                                                                        .Document,
                                                                  ),
                                                                }.withoutNulls,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  'ref':
                                                                      listViewEnvironmentNewsRecord,
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          listViewEnvironmentNewsRecord
                                                              .votes!
                                                              .toList()
                                                              .where((e) =>
                                                                  e.vote! == 1)
                                                              .toList()
                                                              .length
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto Mono',
                                                                color: Color(
                                                                    0xFF4EA14B),
                                                                fontSize: 18,
                                                              ),
                                                        ),
                                                        Text(
                                                          listViewEnvironmentNewsRecord
                                                              .votes!
                                                              .toList()
                                                              .where((e) =>
                                                                  e.vote! == -1)
                                                              .toList()
                                                              .length
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto Mono',
                                                                color: Color(
                                                                    0xFFFF5E5E),
                                                                fontSize: 18,
                                                              ),
                                                        ),
                                                        Text(
                                                          listViewEnvironmentNewsRecord
                                                              .comments!
                                                              .toList()
                                                              .length
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto Mono',
                                                                color: Color(
                                                                    0xFF473BFF),
                                                                fontSize: 18,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(5, 5, 5, 5),
                                                child: Text(
                                                  listViewEnvironmentNewsRecord
                                                      .description!,
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Roboto Mono',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 11,
                                                      ),
                                                ),
                                              ),
                                              Text(
                                                listViewEnvironmentNewsRecord
                                                    .author!
                                                    .maybeHandleOverflow(
                                                  maxChars: 150,
                                                  replacement: '???',
                                                ),
                                                maxLines: 6,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Roboto Mono',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 9,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                            StreamBuilder<List<SocietyNewsRecord>>(
                              stream: querySocietyNewsRecord(
                                queryBuilder: (societyNewsRecord) =>
                                    societyNewsRecord
                                        .orderBy('upVoteCt', descending: true)
                                        .orderBy('downVoteCt', descending: true)
                                        .orderBy('publishedAt',
                                            descending: true),
                                limit: 32,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                    ),
                                  );
                                }
                                List<SocietyNewsRecord>
                                    listViewSocietyNewsRecordList =
                                    snapshot.data!;
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      listViewSocietyNewsRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewSocietyNewsRecord =
                                        listViewSocietyNewsRecordList[
                                            listViewIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 4, 0, 4),
                                      child: InkWell(
                                        onTap: () async {
                                          await launchURL(
                                              listViewSocietyNewsRecord.url!);
                                        },
                                        child: Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          color: FlutterFlowTheme.of(context)
                                              .tertiaryColor,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(5, 0, 5, 0),
                                                child: Text(
                                                  listViewSocietyNewsRecord
                                                      .title!,
                                                  textAlign: TextAlign.start,
                                                  maxLines: 3,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Roboto Mono',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 10, 0, 0),
                                                    child: Image.network(
                                                      listViewSocietyNewsRecord
                                                          .urlToImage!,
                                                      width: 250,
                                                      height: 200,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                15, 0, 0, 0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      10, 0, 2),
                                                          child:
                                                              FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 0,
                                                            borderWidth: 1,
                                                            buttonSize: 40,
                                                            icon: Icon(
                                                              Icons
                                                                  .arrow_upward,
                                                              color: Color(
                                                                  0xFF4EA14B),
                                                              size: 20,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              if (listViewSocietyNewsRecord
                                                                      .votes!
                                                                      .toList()
                                                                      .where((e) =>
                                                                          e.displayName! ==
                                                                          currentUserDisplayName)
                                                                      .toList()
                                                                      .length ==
                                                                  0) {
                                                                final societyNewsUpdateData =
                                                                    {
                                                                  'votes':
                                                                      FieldValue
                                                                          .arrayUnion([
                                                                    getModelVotesFirestoreData(
                                                                      createModelVotesStruct(
                                                                        displayName:
                                                                            currentUserDisplayName,
                                                                        vote: 1,
                                                                        clearUnsetFields:
                                                                            false,
                                                                      ),
                                                                      true,
                                                                    )
                                                                  ]),
                                                                  'upVoteCt':
                                                                      FieldValue
                                                                          .increment(
                                                                              1),
                                                                };
                                                                await listViewSocietyNewsRecord
                                                                    .reference
                                                                    .update(
                                                                        societyNewsUpdateData);
                                                              }
                                                            },
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      2, 0, 2),
                                                          child:
                                                              FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 0,
                                                            borderWidth: 1,
                                                            buttonSize: 40,
                                                            icon: Icon(
                                                              Icons
                                                                  .arrow_downward,
                                                              color: Color(
                                                                  0xFFFF5E5E),
                                                              size: 20,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              if (listViewSocietyNewsRecord
                                                                      .votes!
                                                                      .toList()
                                                                      .where((e) =>
                                                                          e.displayName! ==
                                                                          currentUserDisplayName)
                                                                      .toList()
                                                                      .length ==
                                                                  0) {
                                                                final societyNewsUpdateData =
                                                                    {
                                                                  'votes':
                                                                      FieldValue
                                                                          .arrayUnion([
                                                                    getModelVotesFirestoreData(
                                                                      createModelVotesStruct(
                                                                        displayName:
                                                                            currentUserDisplayName,
                                                                        vote:
                                                                            -1,
                                                                        clearUnsetFields:
                                                                            false,
                                                                      ),
                                                                      true,
                                                                    )
                                                                  ]),
                                                                  'downVoteCt':
                                                                      FieldValue
                                                                          .increment(
                                                                              1),
                                                                };
                                                                await listViewSocietyNewsRecord
                                                                    .reference
                                                                    .update(
                                                                        societyNewsUpdateData);
                                                              }
                                                            },
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      2, 0, 0),
                                                          child:
                                                              FlutterFlowIconButton(
                                                            borderRadius: 0,
                                                            borderWidth: 1,
                                                            buttonSize: 40,
                                                            icon: Icon(
                                                              Icons.chat_bubble,
                                                              color: Color(
                                                                  0xFF473BFF),
                                                              size: 20,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              context.pushNamed(
                                                                'SocietyComments',
                                                                queryParams: {
                                                                  'ref':
                                                                      serializeParam(
                                                                    listViewSocietyNewsRecord,
                                                                    ParamType
                                                                        .Document,
                                                                  ),
                                                                }.withoutNulls,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  'ref':
                                                                      listViewSocietyNewsRecord,
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          listViewSocietyNewsRecord
                                                              .votes!
                                                              .toList()
                                                              .where((e) =>
                                                                  e.vote! == 1)
                                                              .toList()
                                                              .length
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto Mono',
                                                                color: Color(
                                                                    0xFF4EA14B),
                                                                fontSize: 18,
                                                              ),
                                                        ),
                                                        Text(
                                                          listViewSocietyNewsRecord
                                                              .votes!
                                                              .toList()
                                                              .where((e) =>
                                                                  e.vote! == -1)
                                                              .toList()
                                                              .length
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto Mono',
                                                                color: Color(
                                                                    0xFFFF5E5E),
                                                                fontSize: 18,
                                                              ),
                                                        ),
                                                        Text(
                                                          listViewSocietyNewsRecord
                                                              .comments!
                                                              .toList()
                                                              .length
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto Mono',
                                                                color: Color(
                                                                    0xFF473BFF),
                                                                fontSize: 18,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(5, 5, 5, 5),
                                                child: Text(
                                                  listViewSocietyNewsRecord
                                                      .description!,
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Roboto Mono',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 11,
                                                      ),
                                                ),
                                              ),
                                              Text(
                                                listViewSocietyNewsRecord
                                                    .author!
                                                    .maybeHandleOverflow(
                                                  maxChars: 150,
                                                  replacement: '???',
                                                ),
                                                maxLines: 6,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Roboto Mono',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 9,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
