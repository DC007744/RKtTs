export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[]

export type Database = {
  graphql_public: {
    Tables: {
      [_ in never]: never
    }
    Views: {
      [_ in never]: never
    }
    Functions: {
      graphql: {
        Args: {
          operationName?: string
          query?: string
          variables?: Json
          extensions?: Json
        }
        Returns: Json
      }
    }
    Enums: {
      [_ in never]: never
    }
    CompositeTypes: {
      [_ in never]: never
    }
  }
  public: {
    Tables: {
      additional_prompts: {
        Row: {
          chapter_id: string
          created_at: string | null
          follow_up: string
          id: string
          is_active: boolean | null
          order: number
          text: string
          updated_at: string | null
        }
        Insert: {
          chapter_id: string
          created_at?: string | null
          follow_up: string
          id?: string
          is_active?: boolean | null
          order: number
          text: string
          updated_at?: string | null
        }
        Update: {
          chapter_id?: string
          created_at?: string | null
          follow_up?: string
          id?: string
          is_active?: boolean | null
          order?: number
          text?: string
          updated_at?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "additional_prompts_chapter_id_fkey"
            columns: ["chapter_id"]
            isOneToOne: false
            referencedRelation: "workbook_chapters"
            referencedColumns: ["id"]
          },
        ]
      }
      conversation_messages: {
        Row: {
          content: string
          id: string
          role: string
          session_id: string
          timestamp: string
        }
        Insert: {
          content: string
          id?: string
          role: string
          session_id: string
          timestamp?: string
        }
        Update: {
          content?: string
          id?: string
          role?: string
          session_id?: string
          timestamp?: string
        }
        Relationships: [
          {
            foreignKeyName: "conversation_messages_session_id_fkey"
            columns: ["session_id"]
            isOneToOne: false
            referencedRelation: "user_sessions"
            referencedColumns: ["id"]
          },
        ]
      }
      health_check: {
        Row: {
          checked_at: string
          id: number
          status: string
        }
        Insert: {
          checked_at?: string
          id?: number
          status?: string
        }
        Update: {
          checked_at?: string
          id?: number
          status?: string
        }
        Relationships: []
      }
      modules: {
        Row: {
          description: string
          display_order: number
          id: string
          stage: string
          title: string
        }
        Insert: {
          description: string
          display_order: number
          id: string
          stage: string
          title: string
        }
        Update: {
          description?: string
          display_order?: number
          id?: string
          stage?: string
          title?: string
        }
        Relationships: []
      }
      reflection_questions: {
        Row: {
          chapter_id: string
          created_at: string | null
          id: string
          is_active: boolean | null
          order: number
          text: string
          updated_at: string | null
        }
        Insert: {
          chapter_id: string
          created_at?: string | null
          id?: string
          is_active?: boolean | null
          order: number
          text: string
          updated_at?: string | null
        }
        Update: {
          chapter_id?: string
          created_at?: string | null
          id?: string
          is_active?: boolean | null
          order?: number
          text?: string
          updated_at?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "reflection_questions_chapter_id_fkey"
            columns: ["chapter_id"]
            isOneToOne: false
            referencedRelation: "workbook_chapters"
            referencedColumns: ["id"]
          },
        ]
      }
      section_prompts: {
        Row: {
          category: string | null
          created_at: string | null
          follow_up: string | null
          id: string
          is_active: boolean | null
          order: number
          section_id: string
          text: string
          updated_at: string | null
        }
        Insert: {
          category?: string | null
          created_at?: string | null
          follow_up?: string | null
          id?: string
          is_active?: boolean | null
          order: number
          section_id: string
          text: string
          updated_at?: string | null
        }
        Update: {
          category?: string | null
          created_at?: string | null
          follow_up?: string | null
          id?: string
          is_active?: boolean | null
          order?: number
          section_id?: string
          text?: string
          updated_at?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "section_prompts_section_id_fkey"
            columns: ["section_id"]
            isOneToOne: false
            referencedRelation: "workbook_sections"
            referencedColumns: ["id"]
          },
        ]
      }
      session_summaries: {
        Row: {
          created_at: string
          id: string
          session_id: string
          summary: string
          updated_at: string | null
        }
        Insert: {
          created_at?: string
          id?: string
          session_id: string
          summary: string
          updated_at?: string | null
        }
        Update: {
          created_at?: string
          id?: string
          session_id?: string
          summary?: string
          updated_at?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "session_summaries_session_id_fkey"
            columns: ["session_id"]
            isOneToOne: true
            referencedRelation: "user_sessions"
            referencedColumns: ["id"]
          },
        ]
      }
      user_sessions: {
        Row: {
          age: number | null
          chapter_id: string | null
          completed_prompts: string[] | null
          conversation_summary: string | null
          current_chapter_id: string | null
          current_prompt_id: string | null
          current_section_id: string | null
          id: string
          last_active: string
          modules: Json | null
          motivation: string | null
          name: string | null
          onboarding_complete: boolean
          onboarding_step_index: number | null
          reflection_questions_summary: string | null
          season_progress: Json | null
        }
        Insert: {
          age?: number | null
          chapter_id?: string | null
          completed_prompts?: string[] | null
          conversation_summary?: string | null
          current_chapter_id?: string | null
          current_prompt_id?: string | null
          current_section_id?: string | null
          id: string
          last_active?: string
          modules?: Json | null
          motivation?: string | null
          name?: string | null
          onboarding_complete?: boolean
          onboarding_step_index?: number | null
          reflection_questions_summary?: string | null
          season_progress?: Json | null
        }
        Update: {
          age?: number | null
          chapter_id?: string | null
          completed_prompts?: string[] | null
          conversation_summary?: string | null
          current_chapter_id?: string | null
          current_prompt_id?: string | null
          current_section_id?: string | null
          id?: string
          last_active?: string
          modules?: Json | null
          motivation?: string | null
          name?: string | null
          onboarding_complete?: boolean
          onboarding_step_index?: number | null
          reflection_questions_summary?: string | null
          season_progress?: Json | null
        }
        Relationships: [
          {
            foreignKeyName: "user_sessions_current_chapter_id_fkey"
            columns: ["current_chapter_id"]
            isOneToOne: false
            referencedRelation: "workbook_chapters"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "user_sessions_current_section_id_fkey"
            columns: ["current_section_id"]
            isOneToOne: false
            referencedRelation: "workbook_sections"
            referencedColumns: ["id"]
          },
        ]
      }
      workbook_chapters: {
        Row: {
          created_at: string | null
          id: string
          is_active: boolean | null
          number: number
          order: number
          theme: string
          title: string
          updated_at: string | null
        }
        Insert: {
          created_at?: string | null
          id?: string
          is_active?: boolean | null
          number: number
          order: number
          theme: string
          title: string
          updated_at?: string | null
        }
        Update: {
          created_at?: string | null
          id?: string
          is_active?: boolean | null
          number?: number
          order?: number
          theme?: string
          title?: string
          updated_at?: string | null
        }
        Relationships: []
      }
      workbook_content: {
        Row: {
          content: string
          created_at: string
          embedding: string
          id: string
          section: string
          stage: string | null
        }
        Insert: {
          content: string
          created_at?: string
          embedding: string
          id?: string
          section: string
          stage?: string | null
        }
        Update: {
          content?: string
          created_at?: string
          embedding?: string
          id?: string
          section?: string
          stage?: string | null
        }
        Relationships: []
      }
      workbook_sections: {
        Row: {
          created_at: string | null
          id: string
          is_active: boolean | null
          order: number
          title: string
          type: string
          updated_at: string | null
        }
        Insert: {
          created_at?: string | null
          id?: string
          is_active?: boolean | null
          order: number
          title: string
          type: string
          updated_at?: string | null
        }
        Update: {
          created_at?: string | null
          id?: string
          is_active?: boolean | null
          order?: number
          title?: string
          type?: string
          updated_at?: string | null
        }
        Relationships: []
      }
    }
    Views: {
      [_ in never]: never
    }
    Functions: {
      match_workbook_content:
        | {
            Args: {
              query_embedding: string
              match_threshold: number
              match_count: number
            }
            Returns: {
              id: string
              section: string
              content: string
              embedding: string
              created_at: string
              similarity: number
            }[]
          }
        | {
            Args: {
              query_embedding: string
              match_threshold: number
              match_count: number
              filter_by_stage?: string
            }
            Returns: {
              id: string
              section: string
              content: string
              stage: string
              embedding: string
              created_at: string
              similarity: number
            }[]
          }
      save_session_data: {
        Args: {
          p_session_id: string
          p_chapter_id?: string
          p_reflection_questions_summary?: string
          p_conversation_summary?: string
          p_messages?: Json
        }
        Returns: undefined
      }
    }
    Enums: {
      [_ in never]: never
    }
    CompositeTypes: {
      [_ in never]: never
    }
  }
}

type DefaultSchema = Database[Extract<keyof Database, "public">]

export type Tables<
  DefaultSchemaTableNameOrOptions extends
    | keyof (DefaultSchema["Tables"] & DefaultSchema["Views"])
    | { schema: keyof Database },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof Database
  }
    ? keyof (Database[DefaultSchemaTableNameOrOptions["schema"]]["Tables"] &
        Database[DefaultSchemaTableNameOrOptions["schema"]]["Views"])
    : never = never,
> = DefaultSchemaTableNameOrOptions extends { schema: keyof Database }
  ? (Database[DefaultSchemaTableNameOrOptions["schema"]]["Tables"] &
      Database[DefaultSchemaTableNameOrOptions["schema"]]["Views"])[TableName] extends {
      Row: infer R
    }
    ? R
    : never
  : DefaultSchemaTableNameOrOptions extends keyof (DefaultSchema["Tables"] &
        DefaultSchema["Views"])
    ? (DefaultSchema["Tables"] &
        DefaultSchema["Views"])[DefaultSchemaTableNameOrOptions] extends {
        Row: infer R
      }
      ? R
      : never
    : never

export type TablesInsert<
  DefaultSchemaTableNameOrOptions extends
    | keyof DefaultSchema["Tables"]
    | { schema: keyof Database },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof Database
  }
    ? keyof Database[DefaultSchemaTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = DefaultSchemaTableNameOrOptions extends { schema: keyof Database }
  ? Database[DefaultSchemaTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Insert: infer I
    }
    ? I
    : never
  : DefaultSchemaTableNameOrOptions extends keyof DefaultSchema["Tables"]
    ? DefaultSchema["Tables"][DefaultSchemaTableNameOrOptions] extends {
        Insert: infer I
      }
      ? I
      : never
    : never

export type TablesUpdate<
  DefaultSchemaTableNameOrOptions extends
    | keyof DefaultSchema["Tables"]
    | { schema: keyof Database },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof Database
  }
    ? keyof Database[DefaultSchemaTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = DefaultSchemaTableNameOrOptions extends { schema: keyof Database }
  ? Database[DefaultSchemaTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Update: infer U
    }
    ? U
    : never
  : DefaultSchemaTableNameOrOptions extends keyof DefaultSchema["Tables"]
    ? DefaultSchema["Tables"][DefaultSchemaTableNameOrOptions] extends {
        Update: infer U
      }
      ? U
      : never
    : never

export type Enums<
  DefaultSchemaEnumNameOrOptions extends
    | keyof DefaultSchema["Enums"]
    | { schema: keyof Database },
  EnumName extends DefaultSchemaEnumNameOrOptions extends {
    schema: keyof Database
  }
    ? keyof Database[DefaultSchemaEnumNameOrOptions["schema"]]["Enums"]
    : never = never,
> = DefaultSchemaEnumNameOrOptions extends { schema: keyof Database }
  ? Database[DefaultSchemaEnumNameOrOptions["schema"]]["Enums"][EnumName]
  : DefaultSchemaEnumNameOrOptions extends keyof DefaultSchema["Enums"]
    ? DefaultSchema["Enums"][DefaultSchemaEnumNameOrOptions]
    : never

export type CompositeTypes<
  PublicCompositeTypeNameOrOptions extends
    | keyof DefaultSchema["CompositeTypes"]
    | { schema: keyof Database },
  CompositeTypeName extends PublicCompositeTypeNameOrOptions extends {
    schema: keyof Database
  }
    ? keyof Database[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"]
    : never = never,
> = PublicCompositeTypeNameOrOptions extends { schema: keyof Database }
  ? Database[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"][CompositeTypeName]
  : PublicCompositeTypeNameOrOptions extends keyof DefaultSchema["CompositeTypes"]
    ? DefaultSchema["CompositeTypes"][PublicCompositeTypeNameOrOptions]
    : never

export const Constants = {
  graphql_public: {
    Enums: {},
  },
  public: {
    Enums: {},
  },
} as const

